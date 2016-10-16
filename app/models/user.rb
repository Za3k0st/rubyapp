class User < ActiveRecord::Base
  filterrific(
  default_filter_params: { sorted_by: 'created_at_desc' },
  available_filters: [
                :sorted_by,
                :search_query,
                :with_country_id,
                :with_created_at_gte
              ])
  # default for will_paginate
  self.per_page = 10

  scope :search_query, lambda { |query|
   return nil  if query.blank?
   # condition query, parse into individual keywords
   terms = query.downcase.split(/\s+/)
   # replace "*" with "%" for wildcard searches,
   # append '%', remove duplicate '%'s
   terms = terms.map { |e|
     (e.gsub('*', '%') + '%').gsub(/%+/, '%')
   }
   # configure number of OR conditions for provision
   # of interpolation arguments. Adjust this if you
   # change the number of OR conditions.
   num_or_conditions = 3
   where(
     terms.map {
       or_clauses = [
         "LOWER(users.firstname) LIKE ?",
         "LOWER(users.lastname) LIKE ?",
         "LOWER(users.email) LIKE ?"
       ].join(' OR ')
       "(#{ or_clauses })"
     }.join(' AND '),
     *terms.map { |e| [e] * num_or_conditions }.flatten
   )
 }


  scope :sorted_by, lambda { |sort_option|
  # extract the sort direction from the param value.
  direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
  case sort_option.to_s
  when /^created_at_/
    # Simple sort on the created_at column.
    # Make sure to include the table name to avoid ambiguous column names.
    # Joining on other tables is quite common in Filterrific, and almost
    # every ActiveRecord table has a 'created_at' column.
    order("users.created_at #{ direction }")
  else
    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
  end
  }

  scope :with_country_id, lambda { |country_ids|
  where(country_id: [*country_ids])
}

  def self.options_for_sorted_by
    [
      ['Name (a-z)', 'name_asc'],
      ['Registration date (newest first)', 'created_at_desc'],
      ['Registration date (oldest first)', 'created_at_asc'],
      ['Country (a-z)', 'country_name_asc']
    ]
  end

end

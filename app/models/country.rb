class Country < ActiveRecord::Base
  # app/models/country.rb
def self.options_for_select
  order('UPPER(name)').map { |e| [e.name, e.id] }
end
end

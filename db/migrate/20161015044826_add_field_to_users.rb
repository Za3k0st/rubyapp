class AddFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :country, :string
    add_column :users, :personal_email, :string
    add_column :users, :educare_email, :string
    add_column :users, :joining_date, :string
    add_column :users, :ending_date, :string
    add_column :users, :birthday, :string
    add_column :users, :jobrole, :string
    add_column :users, :phone, :string
  end
end

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :firstname
      t.string :lastname
      t.string :image
      t.string :status
      t.string :role
      t.string :country_id
      t.string :personal_email
      t.string :educare_email
      t.string :joining_date
      t.string :ending_date
      t.string :birthdate
      t.string :jobrole
      t.string :phone
      t.timestamps
    end
  end
end

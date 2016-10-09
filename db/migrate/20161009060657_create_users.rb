class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :firstname
      t.string :lastname
      t.string :image
      t.string :status
      t.string :encrypted_password
      t.timestamps
    end
  end
  def self.up
   add_column :image, :post_id, :integer
 end
end

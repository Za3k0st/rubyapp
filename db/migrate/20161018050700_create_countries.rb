class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :id
      t.string :code
      t.string :name

      t.timestamps null: false
    end
  end
end

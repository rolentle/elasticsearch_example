class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
      t.decimal :lat
      t.decimal :long
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :web_url

      t.timestamps null: false
    end
  end
end

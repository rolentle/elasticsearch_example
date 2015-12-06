class ChangeLatLongToLocationForFacility < ActiveRecord::Migration
  def change
    remove_column :facilities, :lat
    remove_column :facilities, :long
    add_column :facilities, :location, :string
  end
end

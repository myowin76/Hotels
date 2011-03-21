class RenameAreaColumnToLocationId < ActiveRecord::Migration
  def self.up
    remove_column :hotels, :area
    add_column :hotels, :location_id, :integer
  end

  def self.down
    remove_column :hotels, :location_id
    add_column :hotels, :area, :string
    
  end
end

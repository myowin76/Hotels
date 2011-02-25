class AddOwnerIdToHotels < ActiveRecord::Migration
  def self.up
    add_column :hotels, :owner_id, :integer
  end

  def self.down
    remove_column :hotels, :owner_id
  end
end

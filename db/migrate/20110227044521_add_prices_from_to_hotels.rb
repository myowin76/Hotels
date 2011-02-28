class AddPricesFromToHotels < ActiveRecord::Migration
  def self.up
    add_column :hotels, :prices_from, :string
  end

  def self.down
    remove_column :hotels, :prices_from
  end
end

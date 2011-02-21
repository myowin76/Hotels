class CreateHotels < ActiveRecord::Migration
  def self.up
    create_table :hotels do |t|
      t.string :name
      t.string :address
      t.string :postcode
      t.string :area
      t.string :phone
      t.string :fax
      t.string :star
      t.string :no_of_rooms
      t.string :overview
      t.text :terms
      t.text :direction
      
      t.timestamps
    end
  end

  def self.down
    drop_table :hotels
  end
end

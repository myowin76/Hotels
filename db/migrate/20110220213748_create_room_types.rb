class CreateRoomTypes < ActiveRecord::Migration
  def self.up
    create_table :room_types do |t|
      t.string :name
      t.text :description
      t.timestamps
    end

	  #Create the linked table between room_types and hotels	  
	  create_table :hotels_room_types do |t|
      t.integer :hotel_id
      t.integer :room_type_id
      t.integer :no_of_rooms      
      t.integer :no_of_available
      t.text :description
      t.string :price
      t.string :offer_price
      t.timestamps
    end
    
	  	add_index :hotels_room_types, :hotel_id
	  	add_index :hotels_room_types, :room_type_id
	  	
	  	RoomType.create(:name => 'Standard Single')
    	RoomType.create(:name => 'Large Single')
    	RoomType.create(:name => 'Standard Double')
    	RoomType.create(:name => 'Moderate Double')
    	RoomType.create(:name => 'Superior Double')
    	RoomType.create(:name => 'Deluxe')
    	RoomType.create(:name => 'Suite')    
    	RoomType.create(:name => 'Studio')
    	RoomType.create(:name => 'King')
  	  RoomType.create(:name => 'Twin')	  	
    	
  end

  def self.down
    drop_table :room_types
    drop_table :hotels_room_types
  end
end

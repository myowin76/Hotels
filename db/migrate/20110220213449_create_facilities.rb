class CreateFacilities < ActiveRecord::Migration
  def self.up
    create_table :facilities do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
    Facility.create(:name => 'Air conditioning in rooms', :description => '')
  	Facility.create(:name => '24 hours Reception')
  	Facility.create(:name => 'Car parking available')
  	Facility.create(:name => 'Wi-Fi available')
  	Facility.create(:name => 'Wi-Fi in rooms')
  	Facility.create(:name => 'Meeting Rooms')  	
  	Facility.create(:name => 'Restaurant')  	
  	Facility.create(:name => 'Gym')  	
  	Facility.create(:name => 'Video DVD player')  	
  	Facility.create(:name => 'TV')  	
  	Facility.create(:name => 'Satellite TV')  	
  	Facility.create(:name => 'Safety Deposit box')  	
  	Facility.create(:name => 'Telephone in each room')  	
  	Facility.create(:name => '24 hours Room Service')  	
  	Facility.create(:name => 'Bar')
  	Facility.create(:name => 'Wheelchair Access')
  	Facility.create(:name => 'Disable Toilets')
  	Facility.create(:name => 'Lift to all floors')
  	Facility.create(:name => 'Currency Exchange')
  	Facility.create(:name => 'Laundry Sercice')

  	Facility.create(:name => 'Mini Bar in Room')
  	Facility.create(:name => 'Hair Dryer in Room')
  end

  def self.down
    drop_table :facilities
  end
end

class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :name
      t.text :desc

      t.timestamps
    end

    Location.create(:name => 'Kilburn')
    Location.create(:name => 'Kensington')
    Location.create(:name => 'Paddington')
    Location.create(:name => 'West End')
    Location.create(:name => 'Notting Hill')
    Location.create(:name => 'Dockland')
    Location.create(:name => 'Bayswater')
    Location.create(:name => 'Covent Garden')
    Location.create(:name => 'Hyde Park')
    Location.create(:name => 'Soho')
    Location.create(:name => 'Ealing')
    Location.create(:name => 'Greenford')
    
  end

  def self.down
    drop_table :locations
  end
end

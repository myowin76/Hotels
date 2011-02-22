class CreateUserTypes < ActiveRecord::Migration
  def self.up
    create_table :user_types do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    
    UserType.create(:name => 'User')
    UserType.create(:name => 'Agent')
    UserType.create(:name => 'Owner')
  end

  def self.down
    drop_table :user_types
  end
end

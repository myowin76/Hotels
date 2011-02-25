class UserType < ActiveRecord::Base
  has_many :users
  
  def self.AdminId
    find_by_name("Admin").id
  end
end

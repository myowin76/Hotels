class Facility < ActiveRecord::Base
  attr_accessible :name, :description

  has_many :hotels_facilities 
  has_many :hotels, :through => :hotels_facilities

end

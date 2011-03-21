class Location < ActiveRecord::Base
    attr_accessible :name, :desc
    
    has_many :hotels
end

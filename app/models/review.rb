class Review < ActiveRecord::Base
  attr_accessible :comment, :rating, :recommand
  belongs_to :hotel
end

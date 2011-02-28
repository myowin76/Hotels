class Photo < ActiveRecord::Base
  attr_accessible :hotel_id, :hotel_photo
  
  belongs_to :hotel
  
  has_attached_file :hotel_photo,
        :styles => {	:thumb => "80x80#",
      					:original => "640x480#"},
        :path => ":rails_root/public/media/hotels/:id/:basename.:extension"

        
  validates_attachment_size :hotel_photo, :less_than => 10.megabytes  
  validates_attachment_presence :hotel_photo
	validates_attachment_content_type :hotel_photo, 
	:content_type => ['image/jpeg', 'image/pjpeg', 
								   'image/jpg', 'image/png']
	
  
end

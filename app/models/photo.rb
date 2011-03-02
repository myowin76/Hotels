class Photo < ActiveRecord::Base

  attr_accessible :hotel_id, :uploaded_file
  belongs_to :hotel
  
  has_attached_file :uploaded_file,
      :styles => {	:thumb => "80x50#",
					  :original => "346x260#"},	
      :url => "hotels/get/:id",
      :path => ":rails_root/hotels/:id/:basename.:extension"
      
      validates_attachment_presence :uploaded_file
    	validates_attachment_content_type :uploaded_file, 
    	:content_type => ['image/jpeg', 'image/pjpeg', 
    								   'image/jpg', 'image/png']

    	def self.destroy_pics(hotel, photos)
    		Photo.find(photos, :conditions => {:hotel_id => hotel}).each(&:destroy)
    	end
    	
  
end

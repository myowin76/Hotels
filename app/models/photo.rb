class Photo < ActiveRecord::Base

  attr_accessible :hotel_id, :uploaded_file
  belongs_to :hotel
  
  has_attached_file :uploaded_file,
      :styles => {	:thumb => "80x50#",
					  :original => "346x260#"},	
            #:url  => "/images/hotels/:id/:style/:basename.:extension",
  		:path => ":rails_root/public/images/hotels/:id/:styles/:basename.:extension",
      :storage => :s3,
      :s3_credentials => "#{RAILS_ROOT}/config/amazon_s3.yml",
      :bucket => "worldskillsukhotels"
  		
      
      
      
      validates_attachment_presence :uploaded_file
    	validates_attachment_content_type :uploaded_file, 
    	:content_type => ['image/jpeg', 'image/pjpeg', 
    								   'image/jpg', 'image/png']



       #def photo_attributes=(photo_attributes)
     	 #photo_attributes.each do |attributes|
       #photos.build(attributes)
       #end
       #end  

    	def self.destroy_pics(hotel, photos)
    		Photo.find(photos, :conditions => {:hotel_id => hotel}).each(&:destroy)
    	end
    	
  
end

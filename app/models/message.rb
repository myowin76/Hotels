class Message < ActiveRecord::Base
  attr_accessible :name, :email, :phone, :body
  
  	validates_presence_of :name, :email, :phone, :body
end

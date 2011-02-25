namespace :db do
  desc "Creating an admin user email 'administrator@hotels.com' with password 'administrator'"
  task :create_admin_user  => :environment do

    puts "Creating an admin user email 'administrator@hotels.com' with password 'administrator'"
    
    user = User.new
    #user.title = "Mr"
    #user.first_name = 'admin'
    #user.last_name = 'admin'
    user.email = 'administrator@hotels.com'
    user.user_type_id = UserType.AdminId
    #user.terms_agreed = true
    user.password_salt = '$2a$10$Bcgc5uzM6l0sRaXw0Z4/he'
    #user.hashed_code = '$2a$10$Bcgc5uzM6l0sRaXw0Z4/heaeO2P3qsp4VBs6XQZ5SM3c0H6K9Gb0K'
    user.encrypted_password = '$2a$10$Bcgc5uzM6l0sRaXw0Z4/heaeO2P3qsp4VBs6XQZ5SM3c0H6K9Gb0K'
    
    user.save
  end
end


  #EXAMPLE USAGE
  #namespace :pick do
  #	task :winner => :environment do
  #		puts "Winner: #{pick(User).name}"
  #	end
  #
  #	task :price => @environment do
  #		puts "Price: #{pick(Product).name}"
  #	end
  
  #task :all => [:price, :winner]
  
  #def pick(model_class)
  #	model_class.find(:first, :order => 'RAND()')
  #end
  #end
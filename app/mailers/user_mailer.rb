class UserMailer < ActionMailer::Base
  #default :from => "from@example.com"
  
  #message to owner
	def contact_us_form_enquiry(from_email, subject, message) 

		from        	from_email
		subject        	subject
		recipients      myowin76@gmail.com
		body			:message => message

		end
end

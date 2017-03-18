require 'faker'

class User

	attr_reader :login, :first_name, :last_name, :password, :email

	def initialize()
		@login = Faker::Name.first_name
		@first_name = Faker::Name.first_name
		@last_name = Faker::Name.last_name
		@password =  rand(99999999)
		@email = Faker::Internet.email(@first_name + @last_name)
	end

	def change_password()
		@password = rand(99999999)
	end

	def user_login_to_s
		string = "user login: #{@login}\n"
	end

	def user_first_name_to_s
		string = "user first name: #{@first_name}\n"
	end

	def user_last_name_to_s
		string = "user last name: #{@last_name}\n"
	end

	def user_pass_to_s
		string = "user password: #{@password}\n"
	end

	def user_email_to_s
		string = "user email: #{@emil}\n"
	end

end

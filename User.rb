require 'faker'

class User

	attr_reader :login, :first_name, :last_name, :password, :email
	attr_accessor :login, :first_name, :last_name, :password, :email

	def initialize(user_data={})
		@login = user_data[:login] || Faker::Name.first_name
		@first_name = user_data[:first_name] || Faker::Name.first_name
		@last_name = user_data[:last_name] || Faker::Name.last_name
		@password = user_data[:password] || rand(99999999)
		@email = user_data[:email] || Faker::Internet.email(@first_name + @last_name)
	end

	def change_password()
		@password = rand(99999999)
	end

end
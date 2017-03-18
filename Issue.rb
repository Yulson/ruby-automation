require 'faker'

class Issue

	attr_reader :issue_name, :issue_type
	attr_accessor :issue_name, :issue_type

	def initialize(options={})
		@issue_name = Faker::Team.name
		@issue_type = options [:issue_type] #vaue1 = bug   value2 = feature   value3 = support
	end
	

end

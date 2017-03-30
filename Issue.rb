require 'faker'

class Issue

	attr_reader :name, :type
	attr_accessor :name, :type

	def initialize(issue_data={})
		@name = issue_data[:name] || Faker::Team.name
		@type = issue_data[:type] || 1 #vaue1 = bug   value2 = feature   value3 = support
	end
	

end

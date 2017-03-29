require 'faker'

class Project

	attr_reader :name, :version
	attr_accessor :name, :version

	def initialize(project_data={})
		@name = project_data[:name] || Faker::Team.name
		@version = project_data[:version] || rand(9999)
	end

end

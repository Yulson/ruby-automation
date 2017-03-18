require 'faker'

class Project

	attr_reader :project_name, :project_version

	def initialize()
		@project_name = Faker::Team.name
		@project_version = rand(9999)
	end

end

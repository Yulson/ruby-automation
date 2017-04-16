require 'faker'

class Project

	attr_reader :name, :version, :project_url
	attr_accessor :name, :version

	def initialize(project_data={})
		@name = project_data[:name] || Faker::Team.name
		@version = project_data[:version] || rand(9999)
	end

	def get_url
		directory = @name.sub(" ", "-")
		project_url = String.new
		project_url = "http://demo.redmine.org/projects/#{directory}"
	end
end
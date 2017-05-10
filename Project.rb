require 'faker'

class Project

	attr_reader :name, :version, :project_url, :url
	attr_accessor :name, :version, :project_url, :url

	def initialize(project_data={})
		@name = project_data[:name] || Faker::Team.name
		@version = project_data[:version] || rand(9999)
		@url = "http://demo.redmine.org/projects/#{@name.gsub(" ", "-")}"
	end
end
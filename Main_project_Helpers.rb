require 'selenium-webdriver'
require_relative 'User'
require_relative 'Project'
require_relative 'Issue'


 module Main_project_Helpers



	def register_user(user_data)
 		user = User.new unless user_data.empty?
		user = user_data.empty? ? User.new : User.new(user_data)

		@driver.find_element(:class, 'register').click
		@wait.until {@driver.find_element(:id, 'user_login').displayed?}
		@driver.find_element(:id, 'user_login').send_keys user.login
		@driver.find_element(:id, 'user_password').send_keys user.password
		@driver.find_element(:id, 'user_password_confirmation').send_keys user.password
		@driver.find_element(:id, 'user_firstname').send_keys user.first_name
		@driver.find_element(:id, 'user_lastname').send_keys user.last_name
		@driver.find_element(:id, 'user_mail').send_keys user.email
		@driver.find_element(:css, '[name="commit"]').click
		user	
	end


	def log_out
		@driver.find_element(:css, '.logout').click
	end


	def log_in(user)
		@driver.find_element(:css, '.login').click
		@driver.find_element(:css, '#username').send_keys user.login
		@driver.find_element(:css, '#password').send_keys user.password
		@driver.find_element(:css, '[name="login"]').click
	end
	

 	def change_pass(user)		
 		@driver.find_element(:css, '.my-account').click
 		@driver.find_element(:css, '.icon-passwd').click
 		@driver.find_element(:css, '#password').send_keys user.password
 		@driver.find_element(:css, '#new_password').send_keys user.change_password
 		@driver.find_element(:css, '#new_password_confirmation').send_keys user.password
 		@driver.find_element(:css, '[name="commit"]').click
 	end
 	

 	def create_new_project(project_data)
 		project = Project.new unless project_data.empty?
		project = project_data.empty? ? Project.new : Project.new(project_data)

 		@driver.find_element(:css, '.projects').click
 		@driver.find_element(:css, '.icon-add').click
 		@driver.find_element(:css, '#project_name').send_keys project.name
 		@wait.until {@driver.find_element(:css, '[name="commit"]').displayed?}
 		@driver.find_element(:css, '[name="commit"]').click
 		project
 	end


 	def create_new_version(project)
  		@driver.find_element(:css, '#tab-versions').click
  		@driver.find_element(:css, '#tab-content-versions .icon-add').click
  		@driver.find_element(:css, '#version_name').send_keys project.version
  		@driver.find_element(:css, '[name="commit"]').click
  	end


    def create_issue_category(issue)
 		@driver.find_element(:css, '#tab-categories').click
  		@driver.find_element(:css, '#tab-content-categories .icon-add').click
  		@driver.find_element(:css, '#issue_category_name').send_keys issue_category
  		@driver.find_element(:css, '[name="commit"]').click
  	end


	def create_new_issue(issue_data)
		issue = Issue.new unless issue_data.empty?
		issue = issue_data.empty? ? Issue.new : Issue.new(issue_data)

 		@driver.find_element(:css, '.new-issue').click
 		@driver.find_element(:css, '#issue_tracker_id').click
 		@driver.find_element(:css, '#issue_tracker_id [value="' + issue.type.to_s + '"]').click
 		@wait.until {@driver.find_element(:css, '#issue_subject').displayed?}
 		@driver.find_element(:css, '#issue_subject').send_keys issue.name
 		@driver.find_element(:css, '[name="commit"]').click
 		@driver.find_element(:css, '.issues').click
 		issue
	end	


	def open_project(project)
		@driver.navigate.to project.get_url
	end


	def open_issues_tab(project)
		open_project(project)
		@wait.until {@driver.find_element(:css, '.issues').displayed?}
		@driver.find_element(:css, '.issues').click
	end


	def is_issues_tab_empty?(project)
		open_issues_tab(project)
		if @driver.find_element(:css, '.nodata').displayed?
			return true
		end

	rescue Selenium::WebDriver::Error::NoSuchElementError => e
		puts 'Exception ' + e.class.to_s + ' issues tab was not empty'
		return false
    end


	def create_or_not_create_new_issue(project)
		open_project(project)
		random_action = rand(0..1)
		if random_action == 1
			issue = create_new_issue({})
			open_issues_tab(project)
		else 
			open_issues_tab(project)
		end
		issue
	end


	def add_self_to_watchers(project, issue)
		open_issues_tab(project)
		@driver.find_element(:link_text, issue.name).click
		@driver.find_element(:css, '.contextual:first-child .icon-fav-off').click
		@driver.navigate().refresh()
	end
	
end
require 'selenium-webdriver'
require_relative 'CustomExceptions'
require_relative 'User'
require_relative 'Project'
require_relative 'Issue'


 module Main_project_Helpers
 	include CustomExceptions



	def register_user(user_data={})
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
		@driver.find_element(:class, 'logout').click
	end


	def log_in(user)
		@driver.find_element(:class, 'login').click
		@driver.find_element(:id, 'username').send_keys user.login
		@driver.find_element(:id, 'password').send_keys user.password
		@driver.find_element(:css, '[name="login"]').click
	end
	

 	def change_pass(user)		
 		@driver.find_element(:class, 'my-account').click
 		@driver.find_element(:class, 'icon-passwd').click
 		@driver.find_element(:id, 'password').send_keys user.password
 		@driver.find_element(:id, 'new_password').send_keys user.change_password
 		@driver.find_element(:id, 'new_password_confirmation').send_keys user.password
 		@driver.find_element(:css, '[name="commit"]').click
 	end
 	

 	def create_new_project(project_data={})
		project = project_data.empty? ? Project.new : Project.new(project_data)

 		@driver.find_element(:class, 'projects').click
 		@driver.find_element(:class, 'icon-add').click
 		@driver.find_element(:id, 'project_name').send_keys project.name
 		@wait.until {@driver.find_element(:css, '[name="commit"]').displayed?}
 		@driver.find_element(:css, '[name="commit"]').click
 		project
 	end


 	def create_new_version(project)
  		@driver.find_element(:id, 'tab-versions').click
  		@driver.find_element(:id, 'tab-content-versions .icon-add').click
  		@driver.find_element(:id, 'version_name').send_keys project.version
  		@driver.find_element(:css, '[name="commit"]').click
  	end


    def create_issue_category(issue)
 		@driver.find_element(:id, 'tab-categories').click
  		@driver.find_element(:id, 'tab-content-categories .icon-add').click
  		@driver.find_element(:id, 'issue_category_name').send_keys issue_category
  		@driver.find_element(:css, '[name="commit"]').click
  	end


	def create_new_issue(issue_data={})
		issue = issue_data.empty? ? Issue.new : Issue.new(issue_data)

 		@driver.find_element(:class, 'new-issue').click
 		@driver.find_element(:id, 'issue_tracker_id').click
 		@driver.find_element(:css, '#issue_tracker_id [value="' + issue.type.to_s + '"]').click
 		@wait.until {@driver.find_element(:id, 'issue_subject').displayed?}
 		@driver.find_element(:id, 'issue_subject').send_keys issue.name
 		@driver.find_element(:name, 'commit').click
 		@driver.find_element(:class, 'issues').click
 		issue
	end	


	def open_project(project)
		@driver.navigate.to project.url
	end


	def open_issues_tab(project)
		open_project(project)
		@wait.until {@driver.find_element(:class, 'issues').displayed?}
		@driver.find_element(:class, 'issues').click
	end


	def is_issues_tab_empty?(project)
		open_issues_tab(project)
		@driver.find_elements(:class, 'nodata').empty? ? false : true
	end
   

	def create_or_not_create_new_issue(project)
		open_project(project)
		random_action = rand(0..1)
		if random_action == 1 
			issue = create_new_issue
		end
		open_issues_tab(project)
		issue
	end


	def add_self_to_watchers(project, issue)
		open_issues_tab(project)
		@driver.find_element(:link_text, issue.name).click
		@driver.find_element(:css, '.contextual:first-child .icon-fav-off').click
		@driver.navigate().refresh()
	end
	
end
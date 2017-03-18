require 'selenium-webdriver'
require_relative 'User'



 module Main_project_Helpers


 	def register_user(user)
		@driver.find_element(:class, 'register').click
		@wait.until {@driver.find_element(:id, 'user_login').displayed?}
		@driver.find_element(:id, 'user_login').send_keys user.login
		@driver.find_element(:id, 'user_password').send_keys user.password
		@driver.find_element(:id, 'user_password_confirmation').send_keys user.password
		@driver.find_element(:id, 'user_firstname').send_keys user.first_name
		@driver.find_element(:id, 'user_lastname').send_keys user.last_name
		@driver.find_element(:id, 'user_mail').send_keys user.email
		@driver.find_element(:css, '[name="commit"]').click
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
 	
 	def create_new_project(project)
 		@driver.find_element(:css, '.projects').click
 		@driver.find_element(:css, '.icon-add').click
 		@driver.find_element(:css, '#project_name').send_keys project.project_name
 		@wait.until {@driver.find_element(:css, '[name="commit"]').displayed?}
 		@driver.find_element(:css, '[name="commit"]').click
 	end

 	def add_user_to_project(user)
 		@driver.find_element(:css, '#tab-members').click
 		@wait.until {@driver.find_element(:css, '.icon-add').displayed?}
 		@driver.find_element(:css, '.icon-add').click
 		@wait.until {@driver.find_element(:css, '#principal_search').displayed?}
 		@driver.find_element(:css, '#principal_search').send_keys user.first_name + ' ' + user.last_name
 		sleep 2
 		@driver.find_element(:css, '#principals input').click
 		value = rand(3...5).to_s
 		@driver.find_element(:css, '.roles-selection [value="' + value + '"]').click
		@driver.find_element(:css, '#member-add-submit').click
	end
	
   def change_roles
 		@driver.find_element(:css, '.odd .icon-edit:nth-child(1)').click
 		@driver.find_element(:css, '.odd [value="5"]:nth-child(1)').click
 		@driver.find_element(:css, '.odd [value="3"]:nth-child(1)').click
 		@driver.find_element(:css, '.odd [name="commit"]').click
 		@driver.find_element(:css, '.even .icon-edit:nth-child(1)').click
 		@driver.find_element(:css, '.even  [value="5"]:nth-child(1)').click
 		@driver.find_element(:css, '.even [value="3"]:nth-child(1)').click
 		@driver.find_element(:css, '.even [name="commit"]').click
 	end

 	def create_new_version(project)
  		@driver.find_element(:css, '#tab-versions').click
  		@driver.find_element(:css, '#tab-content-versions .icon-add').click
  		@driver.find_element(:css, '#version_name').send_keys project.project_version
  		@driver.find_element(:css, '[name="commit"]').click
  	end


    def create_issue_category(issue)
 		@driver.find_element(:css, '#tab-categories').click
  		@driver.find_element(:css, '#tab-content-categories .icon-add').click
  		@driver.find_element(:css, '#issue_category_name').send_keys issue_category
  		@driver.find_element(:css, '[name="commit"]').click
  	end

	def create_new_issue(issue)
 		@driver.find_element(:css, '.new-issue').click
 		@driver.find_element(:css, '#issue_tracker_id').click
 		@driver.find_element(:css, '#issue_tracker_id [value="' + issue.issue_type.to_s + '"]').click
 		sleep 1
 		@driver.find_element(:css, '#issue_subject').send_keys issue.issue_name
 		@driver.find_element(:css, '[name="commit"]').click
 		@driver.find_element(:css, '.issues').click
	end	

end
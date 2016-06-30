require 'selenium-webdriver'
require 'test-unit'

 #class TestRedmine
 #	def setup
 		@driver = Selenium::WebDriver.for :firefox
 		@wait = Selenium::WebDriver::Wait.new(:timeout => 20)
 #	end

 #	def register_user
		@driver.navigate.to 'http://demo.redmine.org/'
		@driver.find_element(:class, 'register').click 
	
		login = ('iuba' + rand(99999).to_s)
		pass = (9999 + rand(99999))
		name = 'iuba'
		lastname = name.reverse
		email = (login + '@247e.com')

		sleep 3
		@driver.find_element(:id, 'user_login').send_keys login
		@driver.find_element(:id, 'user_password').send_keys pass
		@driver.find_element(:id, 'user_password_confirmation').send_keys pass
		@driver.find_element(:id, 'user_firstname').send_keys name
		@driver.find_element(:id, 'user_lastname').send_keys lastname
		@driver.find_element(:id, 'user_mail').send_keys email
		@driver.find_element(:css, '[name="commit"]').click
#	end

#	def log_out
	@driver.find_element(:css, '.logout').click
#	end
	
#	def register_user_2
		@driver.find_element(:class, 'register').click 
	
		login2 = ('login' + rand(99999).to_s)
		pass2 = (9999 + rand(99999))
		name2 = login2.reverse
		lastname2 = login.reverse
		email2 = (login2 + '@247e.com')

		sleep 3
		@driver.find_element(:id, 'user_login').send_keys login2
		@driver.find_element(:id, 'user_password').send_keys pass2
		@driver.find_element(:id, 'user_password_confirmation').send_keys pass2
		@driver.find_element(:id, 'user_firstname').send_keys name2
		@driver.find_element(:id, 'user_lastname').send_keys lastname2
		@driver.find_element(:id, 'user_mail').send_keys email2
		@driver.find_element(:css, '[name="commit"]').click
#	end


#	def log_out
		@driver.find_element(:css, '.logout').click
#	end

#	def log_in
		@driver.find_element(:css, '.login').click
		sleep 3
		@driver.find_element(:css, '#username').send_keys login
		@driver.find_element(:css, '#password').send_keys pass
		@driver.find_element(:css, '[name="login"]').click
#	end

#	def change_pass
		new_password = pass + rand(99999)

		@driver.find_element(:css, '.my-account').click
		@driver.find_element(:css, '.icon-passwd').click
		@driver.find_element(:css, '#password').send_keys pass
		@driver.find_element(:css, '#new_password').send_keys new_password
		@driver.find_element(:css, '#new_password_confirmation').send_keys new_password
		@driver.find_element(:css, '[name="commit"]').click
#	end

#	def create_new_project
		project_name = ('project' + rand(99999).to_s)

		@driver.find_element(:css, '.projects').click
		@driver.find_element(:css, '.icon-add').click
		@driver.find_element(:css, '#project_name').send_keys project_name
		@driver.find_element(:css, '[name="commit"]').click
#	end

#	def add_user2
	
	@driver.find_element(:css, '#tab-members').click
	@driver.find_element(:css, '.icon-add').click
	sleep 3
	@driver.find_element(:css, '#principal_search').send_keys name2
	@driver.find_element(:css, '#principals > label:nth-child(1)').click
	@driver.find_element(:css, '.roles-selection [value="3"]').click
	@driver.find_element(:css, '#member-add-submit').click
	
# 	def change_roles
		sleep 3
		@driver.find_element(:css, '.odd .icon-edit:nth-child(1)').click
		@driver.find_element(:css, '.odd [value="5"]:nth-child(1)').click
		@driver.find_element(:css, '.odd [value="3"]:nth-child(1)').click
		@driver.find_element(:css, '.odd [name="commit"]').click
		sleep 3
		@driver.find_element(:css, '.even .icon-edit:nth-child(1)').click
		@driver.find_element(:css, '.even  [value="5"]:nth-child(1)').click
		@driver.find_element(:css, '.even [value="3"]:nth-child(1)').click
		@driver.find_element(:css, '.even [name="commit"]').click

#	def create_new_version

		project_name_version1 = project_name.reverse
		sleep 5
 		@driver.find_element(:css, '#tab-versions').click
 		sleep 5
 		@driver.find_element(:css, '#tab-content-versions .icon-add').click
 		@driver.find_element(:css, '#version_name').send_keys project_name_version1
 		@driver.find_element(:css, '[name="commit"]').click
 #	end

 #	def create_issue_category
 		issue_type1 = 'bug'
 		issue_type2 = 'task'
 		issue_type3 = 'story'
 		
 		@driver.find_element(:css, '#tab-categories').click
 		sleep 3
 		@driver.find_element(:css, '#tab-content-categories .icon-add').click
 		@driver.find_element(:css, '#issue_category_name').send_keys issue_type1
 		@driver.find_element(:css, '[name="commit"]').click
 		sleep 3
 		@driver.find_element(:css, '#tab-content-categories .icon-add').click
 		@driver.find_element(:css, '#issue_category_name').send_keys issue_type2
 		@driver.find_element(:css, '[name="commit"]').click
 		sleep 3
 		@driver.find_element(:css, '#tab-content-categories .icon-add').click
 		@driver.find_element(:css, '#issue_category_name').send_keys issue_type3	
 		@driver.find_element(:css, '[name="commit"]').click

 	#end
#	def create_issue_type_1
		sleep 3
		issue_subject_1 = 'Unpredictable crashing'
	
		@driver.find_element(:css, ".new-issue").click
		@driver.find_element(:css, "#issue_subject").send_keys issue_subject_1
		@driver.find_element(:css, '[name="commit"]').click

#	end	

#	def create_issue_type_2
		sleep 3
		issue_subject_2 = 'The best improvement ever'

		@driver.find_element(:css, ".new-issue").click
		@driver.find_element(:css, '#issue_tracker_id [value="2"]').click
		@driver.find_element(:css, "#issue_subject").send_keys issue_subject_2
		@driver.find_element(:css, '[name="commit"]').click
#	end

#	def create_issue_type_3
		sleep 3
		issue_subject_3 = 'Small UI changes'

		@driver.find_element(:css, ".new-issue").click
		@driver.find_element(:css, '#issue_tracker_id [value="3"]').click
		@driver.find_element(:css, "#issue_subject").send_keys issue_subject_3
		@driver.find_element(:css, '[name="commit"]').click
#	end


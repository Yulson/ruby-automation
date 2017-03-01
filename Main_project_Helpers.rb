require 'selenium-webdriver'
require 'test-unit'



 class Helpers < Test::Unit::TestCase
 	
 	def setup
 		@driver = Selenium::WebDriver.for :firefox
 		@wait = Selenium::WebDriver::Wait.new(:timeout => 20)
 		@driver.navigate.to 'http://demo.redmine.org/'
 	end

 	def register_user(login, password, name, lastname, email)
		@driver.find_element(:class, 'register').click
		@wait.until {@driver.find_element(:id, 'user_login').displayed?}
		@driver.find_element(:id, 'user_login').send_keys login
		@driver.find_element(:id, 'user_password').send_keys password
		@driver.find_element(:id, 'user_password_confirmation').send_keys password
		@driver.find_element(:id, 'user_firstname').send_keys name
		@driver.find_element(:id, 'user_lastname').send_keys lastname
		@driver.find_element(:id, 'user_mail').send_keys email
		@driver.find_element(:css, '[name="commit"]').click
	end

	def log_out
		@driver.find_element(:css, '.logout').click
	end

	def log_in(login, password)
		@driver.find_element(:css, '.login').click
		@driver.find_element(:css, '#username').send_keys login
		@driver.find_element(:css, '#password').send_keys password
		@driver.find_element(:css, '[name="login"]').click
	end
	
 	def change_pass(password, new_password)		
 		@driver.find_element(:css, '.my-account').click
 		@driver.find_element(:css, '.icon-passwd').click
 		@driver.find_element(:css, '#password').send_keys password
 		@driver.find_element(:css, '#new_password').send_keys new_password
 		@driver.find_element(:css, '#new_password_confirmation').send_keys new_password
 		@driver.find_element(:css, '[name="commit"]').click
 	end
 	
 	def create_new_project (project_name)
 		@driver.find_element(:css, '.projects').click
 		@driver.find_element(:css, '.icon-add').click
 		@driver.find_element(:css, '#project_name').send_keys project_name
 		@wait.until {@driver.find_element(:css, '[name="commit"]').displayed?}
 		@driver.find_element(:css, '[name="commit"]').click
 	end

 	def add_user_to_project(user_name)
 		@wait.until {@driver.find_element(:css, '#flash_notice').displayed?}
 		@driver.find_element(:css, '#tab-members').click
 		@wait.until {@driver.find_element(:css, '.icon-add').displayed?}
 		@driver.find_element(:css, '.icon-add').click
 		@wait.until {@driver.find_element(:css, '#principal_search').displayed?}
 		@driver.find_element(:css, '#principal_search').send_keys user_name
 		@driver.find_element(:css, '#principals > label:nth-child(1)').click
 		@driver.find_element(:css, '.roles-selection [value="3"]').click
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

 	def create_new_version(project_name_version1)
  		@driver.find_element(:css, '#tab-versions').click
  		@driver.find_element(:css, '#tab-content-versions .icon-add').click
  		@driver.find_element(:css, '#version_name').send_keys project_name_version1
  		@driver.find_element(:css, '[name="commit"]').click
  	end


    def create_issue_category(issue_category)
 		@driver.find_element(:css, '#tab-categories').click
  		@driver.find_element(:css, '#tab-content-categories .icon-add').click
  		@driver.find_element(:css, '#issue_category_name').send_keys issue_category
  		@driver.find_element(:css, '[name="commit"]').click
  	end

	def create_new_issue(issue_subject, issue_type)
 		@driver.find_element(:css, ".new-issue").click
 		@driver.find_element(:css, issue_type).click
 		@driver.find_element(:css, "#issue_subject").send_keys issue_subject
 		@driver.find_element(:css, '[name="commit"]').click
	end	

	def teardown
		@driver.quit
	end
end
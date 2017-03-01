require 'selenium-webdriver'
require 'test-unit'
require_relative 'Main_project_Helpers.rb'

 class TestRedmine < Helpers
 	
 	def setup
 		@driver = Selenium::WebDriver.for :firefox
 		@wait = Selenium::WebDriver::Wait.new(:timeout => 20)
 		@driver.navigate.to 'http://demo.redmine.org/'
 		
 		@login1 = ('alogin1' + rand(99999).to_s)
		@pass1 = (9999 + rand(99999))
		@name1 = ('aname1' + rand(99999).to_s)
		@lastname1 = ('lastname1' + rand(99999).to_s)
		@email1 = (@login1 + '@247e.com')

		@new_password = @pass1 + rand(99999)

		@login2 = ('blogin2' + rand(99999).to_s)
		@pass2 = (9999 + rand(99999))
		@name2 = ('bname2' + rand(99999).to_s)
		@lastname2 = ('lastname2' + rand(99999).to_s)
		@email2 = (@login2 + '@247e.com')

		@project_name = ('project' + rand(99999).to_s)
		@project_name_version1 = @project_name.reverse
 	end

	def test_register_user
		register_user(@login1, @pass1, @name1, @lastname1, @email1)
		expected_text = 'Your account has been activated. You can now log in.'
		actual_text = @driver.find_element(:css, '#flash_notice').text
		assert_equal(expected_text, actual_text)
	end

	def test_log_out
		register_user(@login1, @pass1, @name1, @lastname1, @email1)
	 	log_out
	 	assert(@driver.find_element(:css, '.login').displayed?)
	end

	def test_log_in
	 	register_user(@login1, @pass1, @name1, @lastname1, @email1)
	  	log_out
	 	log_in(@login1, @pass1)
		expected_login = @login1
		actual_login = @driver.find_element(:css, '[class="user active"]').text
	 	assert_equal(expected_login, actual_login)
	end

 	def test_change_pass
 		register_user(@login1, @pass1, @name1, @lastname1, @email1)
 		change_pass(@pass1, @new_password)
 		expected_notice = 'Password was successfully updated.'
 		actual_notice = @driver.find_element(:css, '#flash_notice').text
 		assert_equal(expected_notice, actual_notice)
 	end

 	def test_create_new_project
 		register_user(@login1, @pass1, @name1, @lastname1, @email1)
 	 	create_new_project(@project_name)
 	 	expected_notice = 'Successful creation.'
 	 	actual_notice = @driver.find_element(:css, '#flash_notice').text
 	 	assert_equal(expected_notice, actual_notice)
 	end


  	def test_create_new_version
  	 	register_user(@login1, @pass1, @name1, @lastname1, @email1)
  	 	create_new_project(@project_name)
  		create_new_version(@project_name_version1)
  		expected_notice = 'Successful creation.'
 	 	actual_notice = @driver.find_element(:css, '#flash_notice').text
 	 	assert_equal(expected_notice, actual_notice)
  	 end


	def teardown
		@driver.quit
	end
end
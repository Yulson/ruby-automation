require 'faker'
require 'selenium-webdriver'
require 'test-unit'
require_relative 'Main_project_Helpers'
require_relative 'User'
require_relative 'Project'
require_relative 'Issue'

 class TestRedmine < Test::Unit::TestCase
 	include Main_project_Helpers

 	def setup
 		@driver = Selenium::WebDriver.for :firefox
 		@wait = Selenium::WebDriver::Wait.new(:timeout => 20)
 		@driver.navigate.to 'http://demo.redmine.org/'
 		@user1 = User.new
 		@user2 = User.new
 		@project1 = Project.new
 		@issue_bug = Issue.new(:issue_type =>1)
 		@issue_feature = Issue.new(:issue_type =>2)
 		@issue_support = Issue.new(:issue_type =>3)
 	end

	def test_register_user
		register_user(@user1)
		expected_text = 'Your account has been activated. You can now log in.'
		actual_text = @driver.find_element(:css, '#flash_notice').text
		assert_equal(expected_text, actual_text)
	end

	def test_log_out
	 	register_user(@user1)
	  	log_out

	  	assert(@driver.find_element(:css, '.login').displayed?)
	end

	def test_log_in
	  	register_user(@user1)
	   	log_out
	  	log_in(@user1)

	 	expected_login = @user1.login
	 	actual_login = @driver.find_element(:css, '[class="user active"]').text
	  	assert_equal(expected_login, actual_login)
	end

 	def test_change_pass
 		register_user(@user1)
 		change_pass(@user1)
 		expected_notice = 'Password was successfully updated.'
 		actual_notice = @driver.find_element(:css, '#flash_notice').text
 		assert_equal(expected_notice, actual_notice)
 		log_out
 		log_in(@user1)
 		expected_login = @user1.login
		actual_login = @driver.find_element(:css, '[class="user active"]').text
	 	assert_equal(expected_login, actual_login)
 	end


 	def test_create_new_project
 		register_user(@user1)
 	 	create_new_project(@project1)

 	 	expected_notice = 'Successful creation.'
 	 	actual_notice = @driver.find_element(:css, '#flash_notice').text
 	 	assert_equal(expected_notice, actual_notice)
 	end

	def test_add_user_to_project
		register_user(@user1)
		log_out
		register_user(@user2)
		create_new_project(@project1)
		add_user_to_project(@user1)

		expected_notice = 'Successful creation.'
		actual_notice = @driver.find_element(:css, '#flash_notice').text
		assert_equal(expected_notice, actual_notice)
	end

  	def test_create_new_version
   	 	register_user(@user1)
   	 	create_new_project(@project1)
   		create_new_version(@project1)

   		expected_notice = 'Successful creation.'
   	    actual_notice = @driver.find_element(:css, '#flash_notice').text
  	 	assert_equal(expected_notice, actual_notice)
   	end

	def test_create_bug
	    register_user(@user1)
	    create_new_project(@project1)
	    create_new_issue(@issue_bug)
	     	
	    expected_subject = @issue_bug.issue_name
	    actual_array_subjects = Array.new
	    @driver.find_elements(:css, '.subject').each {|element| actual_array_subjects.push(element.text)}
	    assert_match(/#{expected_subject}/, actual_array_subjects.to_s)	
	end

	def test_create_feature
		register_user(@user1)
	    create_new_project(@project1)
	    create_new_issue(@issue_feature)
	     	
	    expected_subject = @issue_feature.issue_name
	    actual_array_subjects = Array.new
	    @driver.find_elements(:css, '.subject').each {|element| actual_array_subjects.push(element.text)}
	    assert_match(/#{expected_subject}/, actual_array_subjects.to_s)	
	end

	def test_create_suppott
	    register_user(@user1)
	    create_new_project(@project1)
	    create_new_issue(@issue_support)
	     	
	    expected_subject = @issue_support.issue_name
	    actual_array_subjects = Array.new
	    @driver.find_elements(:css, '.subject').each {|element| actual_array_subjects.push(element.text)}
	    assert_match(/#{expected_subject}/, actual_array_subjects.to_s)	
	end

    def test_create_issues
     	register_user(@user1)
     	create_new_project(@project1)
     	create_new_issue(@issue_bug)
     	create_new_issue(@issue_feature)
     	create_new_issue(@issue_support)
     	
     	actual_array_subjects = Array.new
     	@driver.find_elements(:css, '.subject').each {|element| actual_array_subjects.push(element.text)}

     	assert_equal(@issue_support.issue_name, actual_array_subjects[0])
     	assert_equal(@issue_feature.issue_name, actual_array_subjects[1])
     	assert_equal(@issue_bug.issue_name, actual_array_subjects[2])
     end


	def teardown
		@driver.quit
	end
end
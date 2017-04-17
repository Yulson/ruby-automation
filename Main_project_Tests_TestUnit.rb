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
 	end


	def test_register_user
		user = register_user
		
		expected_text = 'Your account has been activated. You can now log in.'
		actual_text = @driver.find_element(:css, '#flash_notice').text
		assert_equal(expected_text, actual_text)
	end


	def test_log_out
	  	register_user
	   	log_out
	 	assert(@driver.find_element(:css, '.login').displayed?)
	end


	def test_log_in
	   	user = register_user
	   	log_out
	   	log_in(user)

	  	expected_login = user.login
	  	actual_login = @driver.find_element(:css, '.user.active').text
	   	assert_equal(expected_login, actual_login)
	end


 	def test_change_pass
 		user = register_user
 		change_pass(user)
 		
 		expected_notice = 'Password was successfully updated.'
 		actual_notice = @driver.find_element(:css, '#flash_notice').text
 		assert_equal(expected_notice, actual_notice)
 		log_out
 		log_in(user)
 		expected_login = user.login
		actual_login = @driver.find_element(:css, '[class="user active"]').text
	 	assert_equal(expected_login, actual_login)
 	end


 	def test_create_new_project
 		user = register_user
 	 	project = create_new_project

 	 	expected_notice = 'Successful creation.'
 	 	actual_notice = @driver.find_element(:css, '#flash_notice').text
 	 	assert_equal(expected_notice, actual_notice)
 	end


  	def test_create_new_version
   	 	user = register_user
   	 	project = create_new_project
   		create_new_version(project)

   		expected_notice = 'Successful creation.'
   	    actual_notice = @driver.find_element(:css, '#flash_notice').text
  	 	assert_equal(expected_notice, actual_notice)
   	end


	def test_create_bug
	    user = register_user
	    project = create_new_project
	    issue = create_new_issue({type: '1'})
	     	
	    expected_subject = issue.name
	    actual_array_subjects = []
	    actual_array_subjects = @driver.find_elements(:css, '.subject').map(&:text)
	    assert_true(actual_array_subjects.include? expected_subject)	
	end


	def test_create_feature
		user = register_user
	    project = create_new_project
	    issue = create_new_issue({type: '2'})
	     	
	    expected_subject = issue.name
	    actual_array_subjects = []
	    actual_array_subjects = @driver.find_elements(:css, '.subject').map(&:text)
	    assert_true(actual_array_subjects.include? expected_subject)
	end


	def test_create_support
		user = register_user
	    project = create_new_project
	    issue = create_new_issue({type: '3'})
	    
	    expected_subject = issue.name
	    actual_array_subjects = []
	    actual_array_subjects = @driver.find_elements(:css, '.subject').map(&:text)
	    assert_true(actual_array_subjects.include? expected_subject)
	end


    def test_create_issues
     	user = register_user
	    project = create_new_project
	    issue1 = create_new_issue({type: '1'})
	    issue2 = create_new_issue({type: '2'})
	    issue3 = create_new_issue({type: '3'})
     	
     	actual_array_subjects = @driver.find_elements(:css, '.subject').map(&:text)
     	assert_equal(issue3.name, actual_array_subjects[0])
     	assert_equal(issue2.name, actual_array_subjects[1])
     	assert_equal(issue1.name, actual_array_subjects[2])
     end


    def test_open_project
    	user = register_user
    	project = create_new_project
    	open_project(project)

    	expected_subject = project.name.to_s
    	actual_subject = @driver.find_element(:css, 'h1').text
    	assert_equal(actual_subject, expected_subject)
    end


    def test_if_issues_tab_is_empty
    	user = register_user
     	project = create_new_project
     	open_issues_tab(project)
     	
     	assert(@driver.find_element(:css, '.nodata').displayed?)
    end

	def test_open_issues_tab
		user = register_user
 	  	project = create_new_project
 	  	open_issues_tab(project)
		
		assert(@driver.find_element(:css, '.issues.selected').displayed?)
	end

	def test_add_self_to_watchers
		user = register_user
		project = create_new_project
		issue = create_new_issue
		add_self_to_watchers(project, issue)

		self_watcher = user.first_name + ' ' + user.last_name
		actual_watchers = []
		actual_watchers = @driver.find_elements(:css, 'ul.watchers').map(&:text)
		assert_true(actual_watchers.include? self_watcher)
	end



	# Create project, make a random action: create or not a new bug issue, open project page, open issues tab, if there is a bug present then add self to watchers if no then create a new bug issue and then add self to watchers
	# Verify that there is a bug issue and that current user is a watcher

	def test_create_issue_and_add_self_to_watchers
		user = register_user
		project = create_new_project
		issue = create_or_not_create_new_issue(project)
		if is_issues_tab_empty?(project)
			issue = create_new_issue
			puts 'issues tab was empty================================='
		else
			puts 'issues tab was not empty============================='
		end
		add_self_to_watchers(project, issue)
		self_watcher = user.first_name + ' ' + user.last_name
		actual_watchers = @driver.find_elements(:css, 'ul.watchers').map(&:text)
		assert_true(actual_watchers.include? self_watcher)

		expected_subject = issue.name
	    actual_array_subjects = @driver.find_elements(:css, '.subject').map(&:text)
	    assert_true(actual_array_subjects.include? expected_subject)
	end
    
end 

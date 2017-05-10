require 'faker'
require 'selenium-webdriver'
require 'test/unit'
require 'rspec/expectations'
require_relative 'Main_project_Helpers'
require_relative 'User'
require_relative 'Project'
require_relative 'Issue'
require_relative 'CustomExceptions'

 class TestRedmine < Test::Unit::TestCase
 include Main_project_Helpers
 include RSpec::Matchers

	def setup
 		@driver = Selenium::WebDriver.for :firefox
 		@wait = Selenium::WebDriver::Wait.new(:timeout => 20)
 		@driver.navigate.to 'http://demo.redmine.org/'
 	end


	def test_register_user
		register_user

		flash_notice = @driver.find_element(:id, 'flash_notice').text
		expect(flash_notice).to eql('Your account has been activated. You can now log in.')
	end


	def test_log_out
		register_user
		log_out

		sign_in_button = @driver.find_element(:class, 'login').text
		expect(sign_in_button).to eql('Sign in')
	end


	def test_log_in
		user = register_user
		log_out
		log_in(user)

		log_in_text = @driver.find_element(:css, '[class="user active"]').text
		expect(log_in_text).to eql(user.login)
	end


	def test_change_pass
	 	user = register_user
	 	change_pass(user)
	 		
	 	expected_notice = 'Password was successfully updated.'
	 	actual_notice = @driver.find_element(:id, 'flash_notice').text
	 	assert_equal(expected_notice, actual_notice)
	 	log_out

		flash_notice = @driver.find_element(:id, 'flash_notice').text
		expect(flash_notice).to eql('Password was successfully updated.')

		log_in(user)
		log_in_text = @driver.find_element(:css, '[class="user active"]').text
		expect(log_in_text).to eql(user.login)
	end


 	def test_create_new_project
 		register_user
 	 	create_new_project

		flash_notice = @driver.find_element(:id, 'flash_notice').text
		expect(flash_notice).to eql('Successful creation.')
 	end


 	def test_create_new_version
 		register_user
 		project = create_new_project
 		create_new_version(project)

 		flash_notice = @driver.find_element(:id, 'flash_notice').text
		expect(flash_notice).to eql('Successful creation.')
 	end


	def test_create_bug
		register_user
		create_new_project
		issue = create_new_issue(type: '1')
	     	
		array_subjects = @driver.find_elements(:class, 'subject').map(&:text)
		expect(array_subjects).to include(issue.name)
	end


	def test_create_feature
		register_user
		create_new_project
		issue = create_new_issue(type: '2')

		array_subjects = @driver.find_elements(:class, 'subject').map(&:text)
		expect(array_subjects).to include(issue.name)

	end


	def test_create_support
		register_user
		create_new_project
		issue = create_new_issue(type: '3')

		array_subjects = @driver.find_elements(:class, 'subject').map(&:text)
		expect(array_subjects).to include(issue.name)
	end


	def test_create_issues
		register_user
		create_new_project
		issue1 = create_new_issue(type: '1')
		issue2 = create_new_issue(type: '2')
		issue3 = create_new_issue(type: '3')
		     	
		array_subjects = @driver.find_elements(:class, 'subject').map(&:text)
		expected_subjects = [issue1.name, issue2.name, issue3.name]
		expect(array_subjects).to match_array(expected_subjects)

		expect(issue3.name).to eql(array_subjects[0])
		expect(issue2.name).to eql(array_subjects[1])
		expect(issue1.name).to eql(array_subjects[2])
	end


	def test_open_project
		register_user
		project = create_new_project
		open_project(project)

		expect(@driver.find_element(:css, '.overview.selected').displayed?).to be_truthy
	end


	def test_if_issues_tab_is_empty
		register_user
		project = create_new_project
		open_issues_tab(project)
		     	
		expect(@driver.find_element(:class, 'nodata').displayed?).to be_truthy
	end

	def test_open_issues_tab
		register_user
 	  	project = create_new_project
 	  	open_issues_tab(project)
		
		expect(@driver.find_element(:css, '.issues.selected').displayed?).to be_truthy
	end

	def test_add_self_to_watchers
		user = register_user
		project = create_new_project
		issue = create_new_issue

		add_self_to_watchers(project, issue)

		self_watcher = user.first_name + ' ' + user.last_name
		actual_watchers = @driver.find_elements(:css, 'ul.watchers').map(&:text)
		expect(array_watchers).to include(self_watcher)
	end



	# # Create project, make a random action: create or not a new bug issue, open project page, open issues tab, if there is a bug present then add self to watchers if no then create a new bug issue and then add self to watchers
	# # Verify that there is a bug issue and that current user is a watcher

	def test_create_issue_and_add_self_to_watchers
		user = register_user
		project = create_new_project
		issue = create_or_not_create_new_issue(project)
		if is_issues_tab_empty?(project)
			issue = create_new_issue
		end
		add_self_to_watchers(project, issue)
		self_watcher = user.first_name + ' ' + user.last_name
		actual_watchers = @driver.find_elements(:css, 'ul.watchers').map(&:text)
		expect(actual_watchers).to include(self_watcher)

		array_subjects = @driver.find_elements(:class, 'subject').map(&:text)
		expect(array_subjects).to include(issue.name)
	end
    
end 

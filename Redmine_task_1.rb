require 'selenium-webdriver'
require 'test-unit'

 class TestRedmine < Test::Unit::TestCase
 	
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

	def test_register_user
		register_user(@login1, @pass1, @name1, @lastname1, @email1)
		expected_text = 'Your account has been activated. You can now log in.'
		actual_text = @driver.find_element(:css, '#flash_notice').text
		assert_equal(expected_text, actual_text)
	end

	def log_out
		@driver.find_element(:css, '.logout').click
	end

	def test_log_out
		register_user(@login1, @pass1, @name1, @lastname1, @email1)
	 	log_out
	 	assert(@driver.find_element(:css, '.login').displayed?)
	end

	def log_in(login, password)
		@driver.find_element(:css, '.login').click
		@driver.find_element(:css, '#username').send_keys login
		@driver.find_element(:css, '#password').send_keys password
		@driver.find_element(:css, '[name="login"]').click
	end

	def test_log_in
	 	register_user(@login1, @pass1, @name1, @lastname1, @email1)
	  	log_out
	 	log_in(@login1, @pass1)
		expected_login = @login1
		actual_login = @driver.find_element(:css, '[class="user active"]').text
	 	assert_equal(expected_login, actual_login)
	end
	
 	def change_pass(password, new_password)		
 		@driver.find_element(:css, '.my-account').click
 		@driver.find_element(:css, '.icon-passwd').click
 		@driver.find_element(:css, '#password').send_keys password
 		@driver.find_element(:css, '#new_password').send_keys new_password
 		@driver.find_element(:css, '#new_password_confirmation').send_keys new_password
 		@driver.find_element(:css, '[name="commit"]').click
 	end

 	def test_change_pass
 		register_user(@login1, @pass1, @name1, @lastname1, @email1)
 		change_pass(@pass1, @new_password)
 		expected_notice = 'Password was successfully updated.'
 		actual_notice = @driver.find_element(:css, '#flash_notice').text
 		assert_equal(expected_notice, actual_notice)
 	end

 	
 	def create_new_project (project_name)
 		@driver.find_element(:css, '.projects').click
 		@driver.find_element(:css, '.icon-add').click
 		@driver.find_element(:css, '#project_name').send_keys project_name
 		@wait.until {@driver.find_element(:css, '[name="commit"]').displayed?}
 		@driver.find_element(:css, '[name="commit"]').click
 	end

 	def test_create_new_project
 		register_user(@login1, @pass1, @name1, @lastname1, @email1)
 	 	create_new_project(@project_name)
 	 	expected_notice = 'Successful creation.'
 	 	actual_notice = @driver.find_element(:css, '#flash_notice').text
 	 	assert_equal(expected_notice, actual_notice)
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

	# def test_add_user_to_project
	#  	register_user(@login1, @pass1, @name1, @lastname1, @email1)
	#  	log_out
	#  	register_user(@login2, @pass2, @name2, @lastname2, @email2)
	#  	create_new_project(@project_name)
	#  	add_user_to_project(@name1)

	#  	expected_user_existed = (@name2 + " " + @lastname2).to_s
	#  	expected_user_added = (@name1 + " " + @lastname1).to_s

	#  	user1 = @driver.find_element(:css, '.member:nth-child(1) .name > a').text
	#  	@wait.until {@driver.find_element(:css, '.member:nth-child(2) .name > a').displayed?}
	#  	user2 = @driver.find_element(:css, '.member:nth-child(2) .name > a').text

	#  	assert_equal(expected_user_existed, actual_user_existed)
	#  	assert_equal(expected_user_added, actual_user_added)
	# end
	
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

 	# def test_change_roles
 	# 	change_roles
 	# 	assert(@())
 	# end
 	
 	def create_new_version(project_name_version1)
  		@driver.find_element(:css, '#tab-versions').click
  		@driver.find_element(:css, '#tab-content-versions .icon-add').click
  		@driver.find_element(:css, '#version_name').send_keys project_name_version1
  		@driver.find_element(:css, '[name="commit"]').click
  	end

  	def test_create_new_version
  	 	register_user(@login1, @pass1, @name1, @lastname1, @email1)
  	 	create_new_project(@project_name)
  		create_new_version(@project_name_version1)
  		expected_notice = 'Successful creation.'
 	 	actual_notice = @driver.find_element(:css, '#flash_notice').text
 	 	assert_equal(expected_notice, actual_notice)
  	 end


	# @issue_category1 = 'bug'
	# @issue_category2 = 'task'
	# @issue_category3 = 'story'

    def create_issue_category(issue_category)
 		@driver.find_element(:css, '#tab-categories').click
  		@driver.find_element(:css, '#tab-content-categories .icon-add').click
  		@driver.find_element(:css, '#issue_category_name').send_keys issue_category
  		@driver.find_element(:css, '[name="commit"]').click
  	end

  	# def test_create_issue_categoru
  	# 	create_issue_category(issue_category1)
  	# 	create_issue_category(issue_category2)
  	# 	create_issue_category(issue_category3)
  	# 	assert(@())
  	# end

 #  	@issue_subject_1 = 'Unpredictable crashing'	
 #  	@issue_subject_2 = 'The best improvement ever'
 #  	@issue_subject_3 = 'Small UI changes'

 #  	@issue_type1 = '#issue_tracker_id [value="1"]'
 #  	@issue_type2 = '#issue_tracker_id [value="2"]'
 #  	@issue_type3 = '#issue_tracker_id [value="3"]'

	def create_new_issue(issue_subject, issue_type)
 		@driver.find_element(:css, ".new-issue").click
 		@driver.find_element(:css, issue_type).click
 		@driver.find_element(:css, "#issue_subject").send_keys issue_subject
 		@driver.find_element(:css, '[name="commit"]').click
	end	

	# def test_create_new_issues
	# 	create_new_issue(@issue_subject_1, @issue_type1)
	# 	create_new_issue(@issue_subject_2, @issue_type2)
	# 	create_new_issue(@issue_subject_3, @issue_type3)
	# 	assert(@())

	def teardown
		@driver.quit
	end
end
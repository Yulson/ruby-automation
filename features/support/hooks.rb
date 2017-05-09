Before do
	@driver = Selenium::WebDriver.for :firefox
	@wait = Selenium::WebDriver::Wait.new(:timeout => 20)
	@driver.navigate.to 'http://demo.redmine.org/'
  @user = register_user
  @project = create_new_project
  @issue = create_new_issue
  puts '+++++++++' + user.name
end

After do
	@driver.quit
end

Feature:  Create a project

  As a logged in user
  I want to be able to create a project

  Scenario: Positive create a project

    Given I am logged in as test_user/password
    And I am on "http://demo.redmine.org/projects" page
    When I click on "New project" link
    And I submit project_name
    And I click "Create" button
    Then I see "Successful creation message."
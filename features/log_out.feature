Feature:  Logout user

  As a logged in user
  I want to be able to log out

  Scenario: Log out

    Given I am logged in as test_user
    When I click "log out"
    Then I am on "http://demo.redmine.org/" page
    And "Log in" button is shown
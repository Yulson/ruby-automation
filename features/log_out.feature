Feature:  Logout user

  As a logged in user
  I want to be able to log out

  Scenario: Log out

    Given I am logged in
    When I log out
    Then Home page is open
    And "Log in" button is shown
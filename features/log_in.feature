Feature:  Login user

  As a user
  I want to be able to log in

  Scenario: Positive log in

    Given I am not logged in
    When I log in
    Then I am logged in
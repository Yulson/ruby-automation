Feature:  Change password

  As a logged in user
  I want to be able to change password

  Scenario: Positive change password

    Given I am Logged in
    And I am on My password page
    When I change password
    Then  I see "Password was successfully updated." message.
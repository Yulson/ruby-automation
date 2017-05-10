Feature: Register user

  As a user
  I want to be able to register
  And see the successful message

  Scenario: Positive registration

    Given on Registration page
    When Register user
    Then I see sucsessful message "Your account is activated. You can log in."
    And I am logged in
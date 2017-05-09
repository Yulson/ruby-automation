Feature: Register user

  As a user
  I want to be able to register
  And see the successful message

  Scenario: Positive registration

    Given on Registration page
    When I submit registration form with
    | user_login | user_password | password_confirmation| first_name | last_name | email |
    | user.login | user.password | user.password        | user.firstname | user.lastname | user.email |

    Then I see sucsessful message "Your account is activated. You can log in."
    And I am logged in as login
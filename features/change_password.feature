Feature:  Change password

  As a logged in user
  I want to be able to change password

  Scenario: Positive change password

    Given I am Logged in as test_user/password
    And I am on "http://demo.redmine.org/my/password" page
    When I submit
      | old_password | new_password | new_password_confirmation |
      | user.password   | user.change_password | user.password |
    Then  I see "Password was successfully updated." message.
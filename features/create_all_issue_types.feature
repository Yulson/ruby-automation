Feature: Create all issue types

  As a logged in user
  I want to be able to create all issue types

  Background: I am on New Issue tab on Project page

  Scenario Outline: Positive create an issue of different types
    When I submit data "<issue_type>"/"<subject"
    Then I see successful message "Issue created"
    And Issue is shown on Project/Issues Tab

    Examples:
      | Issue_type | Subject      |
      |	Bug 	   | bug_name     |
      | Support    | support_name |
      | Issue      | issue_name   |

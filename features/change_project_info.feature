Feature: Change project information
  As a user
  I want to be able to add new project versions
  and open issues tab

  Background:
    Given: on Project page

  Scenario: Open issues tab
    When I open Issues tab
    Then I am on Issues tab on Project page
    And I see all issues assigned to project

  Scenario: Positive create new project version
    When I open Versions tab on Project
    And I add new project version
    Then I see message "Successful creation."
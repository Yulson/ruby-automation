Feature: Change project information
  As a user
  I want to be able to add new project versions
  and open issues tab

  Background:
    Given: I create a project
    And I am on project page

  Scenario: Open issues tab
    When I click on Issues tab
    Then I am on Project/Issues page
    And I see all issues assigned to project

  Scenario: Positive create new project version
    When I click on Versions tab
    And I click on "Add new version"
    And I submit project_version
    Then I see message "Successful creation."
Feature:  Open project

  As a user
  I want to be able to open the project

  Scenario: Positive open project

    Given I am on "http://demo.redmine.org/" page
    When I submit project_name into search field
    And I press Enter key
    And I click on project_name
    Then I am on project page
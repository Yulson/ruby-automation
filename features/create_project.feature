Feature:  Create a project

  As a logged in user
  I want to be able to create a project

  Scenario: Positive create a project

    Given I am logged in
    And I am on All projects page
    When I create a new project
    Then I see "Successful creation message."
    And New project is created
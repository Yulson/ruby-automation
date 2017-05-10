Feature:  Open project

  As a user
  I want to be able to open the project

  Scenario: Positive open project

    Given on current page
    When I search for a project
    And Chose a project on Search Results page
    Then Project page is open
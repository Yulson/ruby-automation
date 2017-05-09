Feature: Add self to watchers
  As a logged in user
  I want be able to add self to watchers of any issue

  Scenario: Positive add self to watchers
    Given I am on Issue page
    When I click on "Whatch" icon
    Then I see "Unwatch" icon on the Issue page
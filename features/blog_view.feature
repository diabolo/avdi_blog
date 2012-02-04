Feature: View blog
  Scenario: View blog
    When I view my blog
    Then I should see my blog

  Scenario: View blog entries
    Given my blog has some entries
    When I view my blog
    Then I should see some entries

  Scenario: Sorting of entries
    Given my blog has some entries
    When I view my blog
    Then I should entries sorted in reverse chronological order

  Scenario: Limiting entries displayed
    Given my blog has loads of entries
    When I view my blog
    Then I should see a limited number of entries


Feature: View blog
  Scenario: View blog
    When I view my blog
    Then I should see my blog

    @wip
  Scenario: View blog entries
    Given my blog has some entries
    When I view my blog
    Then I should see some entries

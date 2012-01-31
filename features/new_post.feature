Feature: New Posts
  As a blog author
  I want to create new posts
  So I can publish

  Scenario: Navigate to new post
    When I view my blog
    Then I should be able to create a new post

  Scenario:
    When I submit a new post
    Then I should see my post has been added
    And I should see when my post was added



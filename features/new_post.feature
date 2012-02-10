Feature: New Posts
  As a blog author
  I want to create new posts
  So I can publish

  Scenario: Navigate to new post
    When I view my blog
    Then I should be able to create a new post

  Scenario: Create a post
    When I submit a new post
    Then I should see my post has been added
    And I should see when my post was added

  Scenario: Try to create a post without a title
    When I submit a new post without a title
    Then I should see my new post has not been added
    Then I should see an error about the title

  Scenario: Create a post with picture
    When I submit a new post with a picture
    Then I should see my post has been added
    And I should see my post's picture

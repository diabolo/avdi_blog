module BlogStepHelper
  def blog
    THE_BLOG
  end

  def should_see_blog
    page.should have_css ".blog"
    should_see_title
    should_see_subtitle
  end

  def should_see_subtitle
    page.should have_css ".blog .subtitle", :text => blog.subtitle
  end

  def should_see_title
    page.should have_css ".blog .title", :text => blog.title
  end

  def add_some_entries
    some.times do
      blog.entries << new_post
    end
  end

  def new_post
    blog.new_post.tap do |post|
      post.title = "test post"
      post.body = "lorem ipsum ..."
    end
  end

  def some
    3
  end

end
World(BlogStepHelper)

Given /^my blog has some entries$/ do
  add_some_entries
end

When /^I view my blog$/ do
  visit root_path
end

Then /^I should see my blog$/ do
  should_see_blog
end

Then /^I should see some entries$/ do
  pending # express the regexp above with the code you wish you had
end

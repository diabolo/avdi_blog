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
    some.times do |count|
      blog.add_entry(blog.new_post(:title => count))
    end
  end

  def new_post(*args)
    blog.new_post(args[0]).tap do |post|
      post.title ||= "test post"
      post.body ||= "lorem ipsum ..."
    end
  end

  def some
    3
  end

  def should_see_entries_in_order
    # this is pretty hacky, but the spec should cover it better
    titles = page.all('.entry .title').collect{|entry| entry.text}
    titles.should == titles.sort.reverse
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
  page.should have_css ".entries .entry", :count => some
end

Then /^I should be able to create a new post$/ do
  page.should have_css "a.new_post"
end

Then /^I should entries sorted in reverse chronological order$/ do
  should_see_entries_in_order
end


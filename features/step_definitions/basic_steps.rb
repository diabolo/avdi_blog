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
end
World(BlogStepHelper)

When /^I view my blog$/ do
  visit root_path
end

Then /^I should see my blog$/ do
  should_see_blog
end

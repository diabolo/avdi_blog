module PostSH
  def create_post
    visit new_post_path
    fill_in 'post_title', :with => "Title"
    fill_in 'post_body', :with => 2.sentences
    click_button 'Create Post'
  end

  def create_post_with_picture
    visit new_post_path
    fill_in 'post_title', :with => "Title"
    fill_in 'post_body', :with => 2.sentences
    fill_in 'post_image_url', with: path_to_image
    click_button 'Create Post'
  end

  def path_to_image
    "wet_paint.jpeg"
  end

  def create_post_without_title
    visit new_post_path
    fill_in 'post_title', :with => ''
    fill_in 'post_body', :with => 2.sentences
    click_button 'Create Post'
  end

  def should_be_back_at_new_post
    page.should have_css 'form.new_post'
  end

  def form_should_have_error_message
    page.should have_css "#errorExplanation"
  end

  def form_has_error_for?(field)
    errors = page.all ".field_with_errors"
    errors.each do |er|
      return true if er.native.to_html.match /id=.*_#{field}/
    end
    false
  end
end
World(PostSH)

When /^I submit a new post$/ do
  create_post
end

When /^I submit a new post with a picture$/ do
  create_post_with_picture
end

When /^I submit a new post without a title$/ do
  create_post_without_title
end

Then /^I should see my post has been added$/ do
  page.should have_css ".blog .entry", :count => 1
end

Then /^I should see when my post was added$/ do
  page.should have_css ".blog .entry time", :count => 1
end

Then /^I should see my new post has not been added$/ do
  should_be_back_at_new_post
  form_should_have_error_message
end

Then /^I should see an error about the title$/ do
  form_should_have_error_message
  form_has_error_for?('title').should be_true
end

Then /^I should see my post's picture$/ do
  page.should have_css 'div.entry figure img'
end

Then /^my post's picture should have a caption$/ do
  page.should have_css "figcaption"
end

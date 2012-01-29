module PostSH
  def create_post
    visit new_post_path
    fill_in 'post_title', :with => "Title"
    fill_in 'post_body', :with => 2.sentences
    click_button 'Create Post'
  end
end
World(PostSH)

When /^I submit a new post$/ do
  create_post
end

Then /^I should see my post has been added$/ do
  page.should have_css ".blog .entry", :count => 1
end

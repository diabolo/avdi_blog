require_relative '../../app/models/blog'
require 'ostruct'

describe Blog do
  its(:entries){should be_empty}
end

describe "Blog#new_post" do
  let(:blog){Blog.new}
  subject do
    @new_post = OpenStruct.new
    blog.post_maker = ->{ @new_post}
    blog.new_post
  end
  it "should return a new post" do
    should == @new_post
  end

  it "should set the post's blog reference to itself" do
    subject.blog.should == blog
  end
end

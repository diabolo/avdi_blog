require_relative '../../app/models/blog'
require 'ostruct'

describe Blog do
  let(:blog){Blog.new}
  its(:entries){should be_empty}
  its(:entries){should be_kind_of(Enumerable)}

  describe "#add entry" do
    let(:entry) {Object.new}
    it "should add an entry" do
      expect{blog.add_entry(entry)}.to change {blog.entries.count}.by(1)
    end
  end
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

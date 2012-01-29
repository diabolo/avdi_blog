require 'active_model'
require_relative "../../app/models/post"

describe Post do
  %w(title body blog).each do |rw|
    it {should respond_to(rw.to_sym, "#{rw}=".to_sym)}
  end

  describe "#new" do
    it "should accept an attributes hash" do
      new_post = Post.new(:title => 'title', :body => 'body')
      new_post.title.should == 'title'
      new_post.body.should == 'body'
    end
  end

  describe "#publish" do
    it "should add itself to its blog" do
      blog = double(Blog)
      subject.blog = blog
      blog.should_receive :add_entry
      subject.publish
    end
  end
end


require 'active_model'
require 'date'
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

  context "before publishing" do
    its(:pubdate){should be_nil}
  end

  context "after publishing" do
    let(:now){DateTime.now}
    let(:clock){stub(:now => now)}
    before :each do
      subject.blog = double(:add_entry => nil)
      subject.publish(clock)
    end
    its(:pubdate){should be_kind_of(DateTime)}
    it "pubdate should be correct" do
      subject.pubdate.should == now
    end
  end
end



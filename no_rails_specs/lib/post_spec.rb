require 'active_model'
require 'date'
require_relative "../../app/models/post"

describe Post do
  let(:post){Post.new(title: 'title', body: 'lorem')}

  %w(title body blog image_url).each do |rw|
    it {should respond_to(rw.to_sym, "#{rw}=".to_sym)}
  end

  %w(title).each do |v|
    it "should be invalid with empty #{v}" do
      post.send("#{v}=",'')
      post.should_not be_valid
    end
  end

  describe "#new" do
    it "should accept an attributes hash" do
      new_post = Post.new(:title => 'title', :body => 'body')
      new_post.title.should == 'title'
      new_post.body.should == 'body'
    end
  end

  describe "picture?" do
    it "should be true when post has an image_url" do
      post.image_url = "foo.png"
      post.picture?.should be_true
    end

    it "should be false when post has no image_url" do
      post.image_url = ''
      post.picture?.should be false
    end
  end


  describe "#publish" do
    context "invalid post" do
      before do
        post.should_receive(:valid?).and_return(false)
      end
      it "should not add itself to its blog" do
        blog = double(:blog)
        post.blog = blog
        blog.should_not_receive :add_entry
        post.publish
      end
    end
    it "should add itself to its blog" do
      blog = double(:blog)
      post.blog = blog
      blog.should_receive :add_entry
      post.publish
    end
  end

  context "before publishing" do
    its(:pubdate){should be_nil}
  end

  context "after publishing" do
    let(:now){DateTime.now}
    let(:clock){stub(:now => now)}
    before :each do
      post.blog = double(:add_entry => nil)
      post.publish(clock)
    end
    subject{post}
    its(:pubdate){should be_kind_of(DateTime)}
    it "pubdate should be correct" do
      post.pubdate.should == now
    end
  end
end



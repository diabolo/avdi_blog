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
  let(:post){double(Post)}
  let(:post_maker){double('proc')}
  let(:args){{:x => 42, :y => 'foo'}}

  before :each do
    blog.post_maker = post_maker
  end

  it "should delegate to the post_maker" do
    post_maker.should_receive(:call).and_return(OpenStruct.new)
    blog.new_post
  end

  it "should accept an attribute hash and pass it on to the post maker" do
    post_maker.should_receive(:call).with(args).and_return(OpenStruct.new)
    expect{blog.new_post(args)}.to_not raise_error
  end

  it "should set the post's blog reference to itself" do
    post_maker.should_receive(:call).and_return(post)
    post.should_receive(:blog=).with(blog)
    blog.new_post
  end

end



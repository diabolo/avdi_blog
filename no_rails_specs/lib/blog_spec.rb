require_relative '../../app/models/blog'
require 'ostruct'
require 'active_support/core_ext/numeric/time'
require 'active_support/core_ext/date_time/calculations.rb'

describe Blog do
  let(:now){DateTime.current.to_time}
  let(:blog){Blog.new}

  def stub_entry
    stub_entry_with_date(now)
  end

  def stub_entry_with_date(date)
    OpenStruct.new(:pubdate => date.to_datetime)
  end

  its(:entries){should be_empty}
  its(:entries){should be_kind_of(Enumerable)}

  describe "#add entry" do
    it "should add an entry" do
      expect{blog.add_entry(stub_entry)}.to change {blog.entries.count}.by(1)
    end
  end

  describe "#entries" do
    it "should sort in reverse chronological order" do
      oldest = stub_entry_with_date(now - 2.hours)
      newest = stub_entry_with_date(now)
      middle = stub_entry_with_date(now - 1.hour)

      blog.add_entry(oldest)
      blog.add_entry(newest)
      blog.add_entry(middle)

      blog.entries.should == [newest, middle, oldest]
    end

    it "should limit the entries returned" do
      (2*blog.entries_per_page).times{blog.add_entry(stub_entry)}
      blog.entries.count.should == blog.entries_per_page
    end
  end

  describe "#new_post" do
    let(:post){double(Post)}
    let(:post_source){double('proc')}
    let(:args){{:x => 42, :y => 'foo'}}

    before :each do
      blog.post_source = post_source
    end

    it "should delegate to the post_source" do
      post_source.should_receive(:call).and_return(OpenStruct.new)
      blog.new_post
    end

    it "should accept an attribute hash and pass it on to the post source" do
      post_source.should_receive(:call).with(args).and_return(OpenStruct.new)
      expect{blog.new_post(args)}.to_not raise_error
    end

    it "should set the post's blog reference to itself" do
      post_source.should_receive(:call).and_return(post)
      post.should_receive(:blog=).with(blog)
      blog.new_post
    end
  end
end


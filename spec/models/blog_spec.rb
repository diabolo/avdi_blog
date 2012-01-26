require 'spec_helper'

describe Blog do
  let(:blog) {Blog.new}
  specify {blog.entries.should be_empty}

  describe "add entry" do
    let(:entry) {Object.new}
    expect{blog.add_entry(entry)}.to change {blog.entries.count}.by(1)
  end
end

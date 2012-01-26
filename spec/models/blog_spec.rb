require 'spec_helper'

describe Blog do
  let(:blog) {Blog.new}
  specify {blog.entries.should be_empty}
end

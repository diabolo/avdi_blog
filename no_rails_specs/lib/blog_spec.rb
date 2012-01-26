require_relative '../../app/models/blog'

describe Blog do
  let(:blog) {Blog.new}
  specify {blog.entries.should be_empty}
end

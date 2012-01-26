class Post
  attr_accessor :title, :body, :blog

  def publish
    blog.add_entry(self)
  end
end

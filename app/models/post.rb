class Post
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :title, :body, :blog, :pubdate

  def initialize(attrs={})
    attrs.each { |k,v| send("#{k}=",v) }
  end

  def persisted?
    false
  end

  def publish(clock=DateTime)
    @pubdate = clock.now
    blog.add_entry(self)
  end
end

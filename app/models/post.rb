class Post
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :title, :body, :blog

  def initialize(attrs={})
    attrs.each { |k,v| send("#{k}=",v) }
  end

  def persisted?
    false
  end

  def publish
    blog.add_entry(self)
  end
end

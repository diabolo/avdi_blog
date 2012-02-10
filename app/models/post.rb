class Post
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :title, :body, :blog, :pubdate
  validates :title, presence: true

  def initialize(attrs={})
    attrs.each { |k,v| send("#{k}=",v) }
  end

  def persisted?
    false
  end

  def publish(clock=DateTime)
    return false unless valid?
    @pubdate = clock.now
    blog.add_entry(self)
  end
end

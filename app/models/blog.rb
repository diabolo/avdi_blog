class Blog
  attr_reader :entries
  attr_writer :post_maker

  def initialize
    @entries = []
  end

  def add_entry(entry)
    entries << entry
  end

  def new_post
    post_maker.call.tap do |post|
      post.blog = self
    end
  end

  def title
    "Watching Paint Dry"
  end

  def subtitle
    "The trusted source for drying paint news & opinion"
  end

  private

  def post_maker
    @post_maker ||= Post.public_method(:new)
  end
end
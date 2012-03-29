class Blog
  attr_writer :post_source

  def entries_per_page
    10
  end

  def initialize
    @entries = []
  end

  def add_entry(entry)
    @entries << entry
  end

  def new_post(*args)
    post_source.call(*args).tap do |post|
      post.blog = self
    end
  end

  def title
    "Watching Paint Dry"
  end

  def subtitle
    "The trusted source for drying paint news & opinion"
  end

  def entries
    @entries.sort_by{|e| e.pubdate}.reverse.take(entries_per_page)
  end

  private

  def post_source
    @post_source ||= Post.public_method(:new)
  end
end

require_relative 'exhibit'

class LinkPostExhibit < Exhibit
  def self.applicable_to?(object)
    object.is_a?(Post)
  end

  def render_body
    @context.render(partial: "/posts/link_body", locals: {post: self})
  end
end

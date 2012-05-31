require_relative 'exhibit'

class TextPostExhibit < Exhibit
  def self.applicable_to?(object)
    object.is_a?(Post) and !object.picture?
  end

  def render_body
    @context.render(partial: "/posts/text_body", locals: {post: self})
  end
end

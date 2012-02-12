require_relative 'exhibit'

class PicturePostExhibit < Exhibit
  def self.match?(object)
    object.is_a?(Post) and object.picture?
  end

  def render_body
    @context.render(partial: "/posts/picture_body", locals: {post: self})
  end
end

require_relative 'exhibit'

class PicturePostExhibit < Exhibit
  def render_body
    @context.render(partial: "/posts/picture_body", locals: {post: self})
  end
end

module FigureHelper
  def figure(image_path, caption)
    content_tag(:figure) do
      image_tag(image_path) + content_tag(:figcaption, caption)
    end
  end
end

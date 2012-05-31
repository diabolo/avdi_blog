require_relative '../../app/exhibits/picture_post_exhibit'

describe PicturePostExhibit do
  let(:context){stub}
  let(:post){stub}
  let(:ppe){PicturePostExhibit.new(post, context)}

  %w(title body pubdate).each do |call|
    it "delegates method #{call} to post" do
      post.should_receive(call)
      ppe.send(call)
    end
  end

  it "renders itself with the picture partial" do
    context.should_receive(:render).with(partial: "/posts/picture_body", locals: {post: ppe})
    ppe.render_body
  end

end


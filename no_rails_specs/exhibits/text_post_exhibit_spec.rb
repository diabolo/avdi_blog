require_relative '../../app/exhibits/text_post_exhibit'

describe TextPostExhibit do
  let(:context){stub}
  let(:post){stub}
  let(:text_post_exhibit){TextPostExhibit.new(post, context)}

  %w(title body pubdate).each do |call|
    it "delegates method #{call} to post" do
      post.should_receive(call)
      text_post_exhibit.send(call)
    end
  end

  it "renders itself with the text partial" do
    context.should_receive(:render).with(partial: "/posts/text_body", locals: {post: text_post_exhibit})
    text_post_exhibit.render_body
  end

end

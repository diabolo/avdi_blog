require_relative "../../app/helpers/exhibits_helper"

describe ExhibitsHelper do
  let(:helper){Object.new.tap{|o| o.extend ExhibitsHelper}}
  let(:context){stub}
  let(:post){Post.new}

  it "decorates picture posts with a PicturePostExhibit" do
    post.stub(:picture?).and_return(true)
    helper.exhibit(post, context).should be_kind_of(PicturePostExhibit)
  end

  it "decorates text posts with a TextPostExhibit" do
    post.stub(:text?).and_return(true)
    helper.exhibit(post, context).should be_kind_of(TextPostExhibit)
  end

  it "leaves alone models it doesn't know about" do
    model = Object.new
    helper.exhibit(model, context).should equal model
  end

end

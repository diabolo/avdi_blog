require_relative "../../app/helpers/exhibits_helper"
require_relative "../../app/exhibits/exhibit"

describe ExhibitsHelper do
  let(:helper){Object.new.tap{|o| o.extend ExhibitsHelper}}
  let(:context){stub}
  let(:post){Post.new}

  it "delegates exhibition decisions to Exhibit" do
    Exhibit.should_receive(:exhibit)
    helper.exhibit(stub, context)
  end

end

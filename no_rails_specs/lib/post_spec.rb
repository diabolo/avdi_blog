require_relative "../../app/models/post"

describe Post do
  %w(title body blog).each do |rw|
    it {should respond_to(rw.to_sym, "#{rw}=".to_sym)}
  end

  describe "#publish" do
    it "should add itself to its blog" do
      blog = double(Blog)
      subject.blog = blog
      blog.should_receive :add_entry
      subject.publish
    end
  end
end


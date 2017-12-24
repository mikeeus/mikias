require "../spec_helper"

describe Post do
  describe "#slug" do
    it "returns the title in kebab-case" do
      Post.new(1, Time.now, Time.now, "What a day", "", "", Time.now, 1)
        .slug.should eq "what-a-day"
      Post.new(1, Time.now, Time.now, "already-slugged", "", "", Time.now, 1)
        .slug.should eq "already-slugged"
    end
  end

  describe "#introduction" do
    it "returns the first paragraph" do
      post = Post.new(1, Time.now, Time.now, "",
        "An introduction paragraph.
        Another paragraph.", "", Time.now, 1)
      post.introduction.should eq "An introduction paragraph."
    end
  end

  describe "strips tags" do
    it "removes html tags" do
      Post.strip_tags("<strong>important text</strong>").should eq "important text"
    end
  end
end

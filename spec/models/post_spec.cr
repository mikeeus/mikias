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

  describe "queries" do
    describe "latest" do
      it "returns the latest 5 posts in order of published_at" do
        yesterday = Time.now - 1.day
        insert_post title: "Future", published_at: Time.now + 1.second

        insert_post title: "Sixth latest", published_at: yesterday - 6.second
        insert_post title: "Fifth latest", published_at: yesterday - 5.second
        insert_post title: "Fourth latest", published_at: yesterday - 4.second
        insert_post title: "Third latest", published_at: yesterday - 3.second
        insert_post title: "Second latest", published_at: yesterday - 2.second
        insert_post title: "First latest", published_at: yesterday - 1.second

        latest_posts = PostQuery.new.latest.results
        latest_posts.size.should eq 5
        latest_posts.first.title.should eq "First latest"
        latest_posts.last.title.should eq "Fifth latest"
        latest_posts.map(&.title).should_not contain("Sixth latest")
        latest_posts.map(&.title).should_not contain("Future")
      end
    end

    describe "find_published_by_slug" do
      it "find a published post" do
        insert_post title: "is published", published_at: Time.now - 1.day
        found = PostQuery.new.find_published_by_slug("is-published")
        found.title.should eq "is published"
      end

      it "does not find unpublished posts" do
        insert_post title: "not published", published_at: Time.now + 1.day
        not_published = PostQuery.new.title("not published").first
        expect_raises LuckyRecord::RecordNotFoundError do
          PostQuery.new.find_published_by_slug(not_published.slug)
        end
      end
    end
  end
end

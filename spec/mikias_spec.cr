require "./spec_helper"

describe "Mikias" do
  describe "/" do
    it "shows a title" do
      visitor = AppVisitor.new
      visitor.visit("/")
      visitor.should contain "<title>Mikias Abera</title>"
    end

    it "shows latest posts" do
      insert_post title: "First"
      insert_post title: "Second"
      insert_post title: "Third"
      insert_post title: "Fourth"

      visitor = AppVisitor.new

      visitor.visit("/")

      visitor.should contain "<h2>Latest Posts</h2>"
      # visitor.should contain "Lorem ipsum<a href=\"/posts/lorem-ipsum\">#</a>"
    end
  end

  # describe "/blog/posts/new" do
  #   it "shows an editor and a button" do
  #     visitor = AppVisitor.new

  #     visitor.visit("/posts/new")

  #     visitor.should contain "<h1>New post</h1>"
  #     visitor.should contain "input type=\"text\" id=\"post_title\""
  #     visitor.should contain "textarea"
  #     visitor.should contain "input type=\"text\" id=\"post_tags\""
  #     visitor.should contain "input type=\"submit\""
  #   end
  # end

  # describe "/blog/posts/create" do
  #   context "none of the fields filled" do
  #     it "rerenders the form with errors" do
  #       visitor = AppVisitor.new
  #       data = {
  #         "post:title" => "",
  #         "post:content" => ""
  #       }

  #       visitor.post("/posts/create", data)

  #       visitor.should contain "Title is required"
  #       visitor.should contain "Content is required"
  #     end
  #   end

  #   context "all fields filled" do
  #     it "pusblishes a new post" do
  #       visitor = AppVisitor.new
  #       data = {
  #         "post:title" => "some title",
  #         "post:content" => "some content"
  #       }

  #       visitor.post("/posts/create", data)

  #       visitor.should redirect_to("/")
  #       PostQuery.new.latest.results.size.should eq 1
  #     end
  #   end
  # end

  # context "with a post titled 'welcome'" do
  #   describe "/posts/welcome" do
  #     it "renders a single post" do
  #       insert_post title: "Welcome", published_at: Time.now - 1.days

  #       visitor = AppVisitor.new

  #       visitor.visit("/posts/welcome")

  #       visitor.should contain "<h2>Welcome"
  #       visitor.should contain "<a href=\"/\">« All posts</a>"
  #       visitor.should contain "Welcome</title>"
  #     end
  #   end
  # end
end

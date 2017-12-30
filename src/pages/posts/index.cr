class Posts::IndexPage < MainLayout
  include Posts::Components
  include Posts::Comments::Components
  needs posts : Array(Post)

  def inner
    div id: "posts-index" do
      @posts.each do |post|
        post_preview(post)
      end
    end
  end
end

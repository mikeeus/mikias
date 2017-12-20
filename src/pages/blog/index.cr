class Blog::IndexPage < MainLayout
  include Blog::Posts::Components
  include Blog::Comments::Components
  needs posts : Array(Post)

  def inner
    @posts.each do |post|
      post_preview(post)
    end
  end
end

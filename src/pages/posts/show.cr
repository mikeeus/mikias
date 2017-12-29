class Posts::ShowPage < MainLayout
  include Posts::Comments::Components
  needs post : Post

  def inner
    header class: "post-header" do
      h1 post.title
    end

    div class: "post-content" do
      raw post.content
    end

    footer class: "post-footer" do
      post.published_at
    end

    comments(post.comment_id)
  end
end

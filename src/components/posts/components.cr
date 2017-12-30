require "markdown"

module Posts::Components
  private def full_post(post : Post)
    h1 post.title
    raw post.content
  end

  private def latest_posts
    div class: "latest-posts-container" do
      posts = PostQuery.new
      posts.each do |post|
        div class: "latest-post" do
          post_preview(post)
        end
      end
    end
  end

  private def post_preview(post : Post)
    div class: "post-preview" do
      header do
        h2 post.title
      end
      div class: "post-preview-body" do
        raw post.preview
      end
      div class: "push"
      footer do
        post_meta(post)
      end
    end
  end

  private def post_meta(post : Post)
    span post.published_string, class: "post-title-meta"
    material_icon("arrow_forward")
  end

  private def material_icon(id)
    i class: "material-icons" do
      text id
    end
  end
  # tags
end
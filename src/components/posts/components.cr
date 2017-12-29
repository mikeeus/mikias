require "markdown"

module Posts::Components
  private def full_post(post : Post)
    h1 post.title
    raw post.content
  end

  private def post_preview(post : Post)
    div class: "post-preview" do
      header class: "post-preview-title" do
        h2 post.title
      end
      div class: "post-preview-body" do
        raw post.preview
      end
      footer class: "post-preview-footer" do
        post_meta(post)
      end
    end
  end

  private def post_meta(post : Post)
    span post.published_string, class: "post-title-meta"
  end
  # tags
end
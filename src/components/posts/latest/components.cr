module Posts::Latest::Components
  private def latest_posts
    div class: "latest-posts-container" do
      posts = PostQuery.new
      posts.each do |post|
        div class: "latest-post" do
          post_preview_box(post)
        end
      end
    end
  end

  def post_preview_box(post : Post)
    header do
      span post.published_string
    end
    h3 post.title
    para post.preview
    footer do
      material_icon("arrow_forward")
    end
  end

  private def material_icon(id)
    i class: "material-icons" do
      text id
    end
  end
end
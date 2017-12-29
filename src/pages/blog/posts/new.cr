class Blog::Posts::NewPage < MainLayout
  needs post_form : PostForm

  def inner_head
    css_link "/css/simplemde.min.css"
    js_link "/js/simplemde.min.js"
    raw "<script>document.addEventListener('DOMContentLoaded', function() { var simplemde = new SimpleMDE(); }, false);</script>"
  end

  def inner
    section class: "post-editor form-container" do
      render_post_form(@post_form)
    end
  end

  private def render_post_form(f)
    form_for Blog::Posts::Create, class: "m-form" do
      h1 "New post"
      div class: "form-row" do
        label_for f.title
        text_input f.title
        errors_for f.title
      end

      div class: "form-col" do
        label_for f.content
        textarea f.content
        errors_for f.content
      end

      div class: "form-row" do
        label_for f.tags
        text_input f.tags
        errors_for f.tags
      end


      div class: "form-row" do
        label_for f.published_at
        text_input f.published_at
        errors_for f.published_at
      end

      div class: "form-row" do
        label_for f.comment_id
        text_input f.comment_id
        errors_for f.comment_id
      end

      submit "Save Post"
    end
  end
end

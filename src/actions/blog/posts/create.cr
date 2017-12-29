class Blog::Posts::Create < AdminAction
  post "/posts/create" do
    PostForm.create(params) do |form, post|
      if post
        redirect Blog::Index
      else
        # flash.now "error", "#{pp form.errors}"
        render Blog::Posts::NewPage, post_form: form
      end
    end
  end
end

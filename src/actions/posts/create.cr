class Posts::Create < AdminAction
  action do
    PostForm.create(params) do |form, post|
      if post
        flash.success = "Post successfully created!"
        redirect Posts::Index
      else
        render Posts::NewPage, post_form: form
      end
    end
  end
end

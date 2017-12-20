class Blog::Posts::New < AdminAction
  action do
    render post_form: PostForm.new
  end
end
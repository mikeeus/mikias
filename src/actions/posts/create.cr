class Posts::Create < AdminAction
  post "/posts/create" do
    puts "hello"
    PostForm.create(params) do |form, post|
      pp form
      pp post
      if post
        redirect Posts::Index
      else
        @context.flash.now[:just_for_this_request] = "error: #{pp form.errors}"
        pp form.errors
        render Posts::NewPage, post_form: form
      end
    end
  end
end

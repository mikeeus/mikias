class Posts::Show < BrowserAction
  action do
    post = PostQuery.new.find_published_by_slug(id)
    render post: post
  end
end

class Blog::Index < BrowserAction
  action do
    posts = PostQuery.new.latest.results
    render posts: posts
  end
end
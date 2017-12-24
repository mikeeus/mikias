class PostQuery < Post::BaseQuery
  def latest
    published.published_at.desc_order.limit(5)
  end

  def published
    published_at.lte(Time.now)
  end

  def find_published_by_slug(slug : String) : Post
    post = published.title.lower.is(titlelize(slug)).first? ||
      raise LuckyRecord::RecordNotFoundError.new(:post, slug)
  end

  private def titlelize(slug)
    slug.downcase.gsub("-", " ")
  end
end
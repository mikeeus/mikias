def insert_post(title = "title", content = "content", published_at = Time.now - 1.day, tags : String? = nil)
  LuckyRecord::Repo.run do |db|
    db.exec "INSERT into posts(created_at, updated_at, title, content, tags, published_at, comment_id) VALUES ($1, $2, $3, $4, $5, $6, $7)",
      Time.now,
      Time.now,
      title,
      content,
      tags,
      published_at,
      1
  end
end

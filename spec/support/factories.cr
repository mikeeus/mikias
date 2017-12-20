def insert_post(title = "title", published_at = Time.now - 1.day, tags : String? = nil)
  LuckyRecord::Repo.run do |db|
    db.exec "INSERT into posts(created_at, updated_at, title, content, tags, published_at) VALUES ($1, $2, $3, $4, $5, $6)",
      Time.now,
      Time.now,
      title,
      tags,
      "productivity,polyphasic"
      published_at
  end
end

class CreatePosts::V20171206232053 < LuckyMigrator::Migration::V1
  def migrate
    create :posts do
     add title : String
     add content : String
     add tags : String
     add published_at : Time
     add comment_id : Int32
    end
  end

  def rollback
    drop :posts
  end
end

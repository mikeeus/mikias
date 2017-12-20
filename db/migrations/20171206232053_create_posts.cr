class CreatePosts::V20171206232053 < LuckyMigrator::Migration::V1
  def migrate
    create :posts do
     add title : String
     add content : String
     add tags : String?
     add published_at : Time
    end

    # Run custom SQL with execute
    #
    # execute "CREATE UNIQUE INDEX posts_title_index ON posts (title);"
  end

  def rollback
    drop :posts
  end
end

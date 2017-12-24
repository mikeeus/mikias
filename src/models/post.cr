# Post models a blog article.
# It has a title, content, tags, published_at date and a
# comment_id property. The comment_id references a Github issue
# which is used for comments.
class Post < BaseModel
  table :posts do
    field title : String
    field content : String
    field tags : String
    field published_at : Time
    field comment_id : Int32
  end

  # Convert title to kebab-case for use in URLs
  def slug
    title.downcase.gsub(" ", "-")
  end

  # Returns the first paragraph
  def introduction
    content.split("\n").first
  end

  # Returns the content truncated to a certain number of characters
  def preview
    truncate_with_line_breaks(Post.strip_tags(Markdown.to_html(content)))
  end

  # Truncates a string to a certain length while adding
  # converting line breaks to html br tags.
  private def truncate_with_line_breaks(string : String, length = 300)
    formatted = string[0,length].gsub("\n", "<br>")
    if string.size > length
      formatted += "..."
    end
    formatted
  end

  # Remove html tags
  def self.strip_tags(string : String)
    string.gsub(/<\/?[^>]*>/, "")
  end

  # Return the pubilshed_at time as string
  def published_string
    Time::Format.new("%B %-d, %Y").format(published_at)
  end
end

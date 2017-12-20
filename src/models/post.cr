class Post < BaseModel
  table :posts do
    field title : String
    field content : String
    field tags : String
    field published_at : Time
  end

  def slug
    title.downcase.gsub(" ", "-")
  end

  def introduction
    content.split("\n\n").first
  end

  # def before_subheader(content : String)
  #   content.split("\n## ").first # Should return section before first sub header
  # end

  def preview
    truncate_with_line_breaks(strip_tags(Markdown.to_html(content)))
  end

  private def truncate_with_line_breaks(string : String, length = 300)
    string[0,length].gsub("\n", "<br>") + "..."
  end

  private def strip_tags(string : String)
    string.gsub(/<\/?[^>]*>/, "")
  end

  def published_string
    Time::Format.new("%B %-d, %Y").format(published_at)
  end
end

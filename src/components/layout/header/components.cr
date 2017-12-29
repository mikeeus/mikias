module Layout::Header::Components
  def layout_header(brand : String, **links)
    div class: "nav" do
      link brand.to_s, class: "brand", to: "/"
      ul role: "navigation" do
        if Lucky::Env.development?
          links.each do |label, url|
            li do
              link label.to_s, to: url, class: "m-button"
            end
          end
          li do
            link "+ post", to: Posts::New, class: "m-button"
          end
        end
      end
    end
  end
end

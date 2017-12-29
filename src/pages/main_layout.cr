abstract class MainLayout
  include Lucky::HTMLPage
  include Shared::FieldErrorsComponent
  include Shared::FlashComponent
  include Layout::Header::Components

  # You can put things here that all pages need
  #
  # Example:
  #   needs current_user : User

  def inner_head
  end

  abstract def inner

  def render
    html_doctype

    html lang: "en" do
      head do
        utf8_charset
        title page_title
        csrf_meta_tags
        meta name: "viewport", content: "width=device-width, initial-scale=1"
        css_link asset("css/app.css")
        js_link asset("js/app.js")
        js_link asset("js/jquery-3.2.1.min.js")
        inner_head
      end

      body do
        layout_header "ma", blog: Posts::Index
        render_flash
        div id: "content-container" do
          inner
        end
      end
    end
  end

  def page_title
    "Mikias Abera"
  end
end

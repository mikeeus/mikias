abstract class MainLayout
  include Lucky::HTMLPage
  include Shared::FieldErrorsComponent
  include Shared::FlashComponent
  include Layout::Header::Components

  # You can put things here that all pages need
  #
  # Example:
  #   needs current_user : User
  needs flash : Lucky::Flash::Store

  def inner_head
  end

  abstract def inner

  def render
    html_doctype

    html lang: "en" do
      head do
        utf8_charset
        title page_title
        meta name: "viewport", content: "width=device-width, initial-scale=1"
        css_link asset("css/app.css")
        js_link asset("js/app.js")
        js_link asset("js/simplebar.js")
        css_link asset("css/simplebar.css")
        inner_head
      end

      body do
        layout_header "ma", blog: "/blog"
        render_flash
        div class: "content-container" do
          inner
        end
      end
    end
  end

  def page_title
    "Mikias Abera"
  end
end

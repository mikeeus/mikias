class Home::IndexPage < MainLayout
  include Home::Components

  def inner_head
    css_link asset("css/octicons.min.css")
    css_link asset("css/github-activity-0.1.5.min.css")
    js_link asset("js/mustache.min.js")
    js_link asset("js/github-activity-0.1.5.min.js")
  end

  def inner
    section id: "home-splash" do
      span class: "home-splash-overlay"
      div class: "home-splash-text" do
        text "Mikias Abera"
      end
    end

    home_intro_section
    home_github_activity_section
    home_blog_section


    div class: "divider-activity-tools"

    home_tools_section

    div class: "divider-tools-projects"

    home_contact_section
  end
end

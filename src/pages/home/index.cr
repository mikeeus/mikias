class Home::IndexPage < MainLayout
  include Blog::Latest::Components
  include Github::Components

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
    section id: "home-intro" do
      div "My name is Mikias Abera. I'm passionate about the power of technology to solve problems. Currently hacking in Ruby, Typescript and Crystal. You'll find me either in Toronto, Canada or Addis Ababa, Ethiopia."
    end
    section id: "home-blog" do
      latest_posts
    end
    section id: "home-activity" do
      github_events
    end
    section id: "home-skills" do
      div "SKILLS"
    end
  end
end

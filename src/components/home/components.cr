module Home::Components
  include Github::Components
  include Blog::Latest::Components

  private def home_intro_section
    section id: "home-intro" do
      ul do
        li do
          material_icon("whatshot")
          strong "Passionate"
          text " about pushing my limits and learning."
        end
        li do
          material_icon("memory")
          strong "Fascinated"
          text " by the power of technology to solve problems."
        end
        li do
          material_icon("alarm_on")
          strong "Self motivated"
          text ", I don't need a reason to crush it daily."
        end
        # self motivated
        li do
          material_icon("hotel")
          strong "Sleep 4.5 hours"
          text " a day, "
          strong "learn"
          text " and "
          strong "hack"
          text " the rest."
        end
        li do
          material_icon("computer")
          text "Currently building in "
          strong "Typescript"
          text ", "
          strong "Ruby"
          text " and "
          strong "Crystal"
          text "."
        end
        li do
          material_icon("flight")
          text "Can be found in "
          strong "Toronto"
          text " or "
          strong "Addis Ababa."
        end
      end
    end
  end

  private def home_github_activity_section
    section id: "home-activity" do
      div class: "skewed-top"
      github_events
      div class: "skewed-bottom"
    end
  end

  private def home_tools_section
    section id: "home-tools" do
      div class: "skewed-top"


      # div class: "home-tools" do
      #   div class: "home-tool" do
      #     img src: "/images/logos/rubyonrails.png"
      #     span "Ruby on Rails"
      #   end
      #   div class: "home-tool" do
      #     img src: "/images/logos/angular.svg"
      #     span "Angular (2+)"
      #   end
      #   div class: "home-tool" do
      #     img src: "/images/logos/lucky.svg"
      #     span "Lucky Framework"
      #   end
      #   div class: "home-tool" do
      #     img src: "/images/logos/postgresql.png"
      #     span "PostgreSQL"
      #   end
      # end

      h2 "Languages"

      div class: "home-languages" do
        div class: "home-lang" do
          img src: "/images/logos/typescript.png"
          div do
            div "Typescript"
            small "25+ hours/week"
          end
        end
        div class: "home-lang" do
          img src: "/images/logos/ruby.png"
          div do
            div "Ruby"
            small "15+ hours/week"
          end
        end
        div class: "home-lang" do
          img src: "/images/logos/crystal-lang.png"
          div do
            div "Crystal"
            small "15+ hours/week"
          end
        end
        div class: "home-lang" do
          img src: "/images/logos/html5.png"
          div do
            div "HTML5"
            small "5+ hours/week"
          end
        end
        div class: "home-lang" do
          img src: "/images/logos/css3.png"
          div do
            div "CSS3"
            small "5+ hours/week"
          end
        end
      end

      div class: "skewed-bottom"
    end
  end

  private def home_experience_section

  end

  private def home_contact_section
    section id: "home-contact" do
      h2 "Get in touch"
    end
  end

  private def home_blog_section
    div class: "divider-blog-activity"

    section id: "home-blog" do
      h2 "Blog"
      latest_posts
    end
  end

  private def material_icon(id)
    i class: "material-icons" do
      text id
    end
  end
end
class Home::IndexPage < MainLayout
  include Home::Components

  def inner_head
    css_link asset("css/octicons.min.css")
    css_link asset("css/github-activity-0.1.5.min.css")
    js_link asset("js/mustache.min.js")
    js_link asset("js/github-activity-0.1.5.min.js")
  end

  def inner
    change_header_on_scroll_script

    section id: "home-splash" do
      img src: asset("images/home-splash.jpeg")
      span class: "home-splash-overlay"
      div class: "home-splash-text" do
        text "Mikias Abera"
        para "hello@mikias.net"
        div class: "home-splash-social" do
          link to: "https://github.com/mikeeus" do
            img src: "/images/icons/github.svg"
          end
          link to: "https://www.linkedin.com/in/mikeeus" do
            img src: "/images/icons/linkedin.png"
          end
        end
      end
    end

    home_intro_section
    home_github_activity_section
    home_blog_section
    home_tools_section
    home_contact_section
  end

  private def change_header_on_scroll_script
    script do
      raw %(
        $(document).ready(function() {
          $('.nav').addClass('home-nav');
          var homeSplash = $('#home-splash');
          var mainbottom = homeSplash.offset().top + homeSplash.height();

          // on scroll,
          if (homeSplash) {
            $(window).on('scroll',function(){

              // we round here to reduce a little workload
              var stop = Math.round($(window).scrollTop());
              if (stop > mainbottom) {
                  $('.home-nav').addClass('past-main');
              } else {
                  $('.home-nav').removeClass('past-main');
              }

            });
          }
        });
      )
    end
  end
end

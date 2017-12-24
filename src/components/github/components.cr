module Github::Components
  private def github_events
    h2 "Github Activity"
    github_activity_header
    div id: "gh-event-feed"
    github_events_script
  end

  private def github_activity_header
    div class: "gha-header" do
      div class: "gha-github-icon" do
        span class: "octicon octicon-mark-github"
      end
      div class: "gha-user-info" do
        link target: "_blank", to: "https://github.com/mikeeus" do
          text "Mikias Abera"
        end
        para do
          link to: "https://github.com/mikeeus", target: "_blank" do
            text "mikeeus"
          end
        end
      end
      div class: "gha-gravatar" do
        link to: "https://github.com/mikeeus", target: "_blank" do
          img src: "https://avatars1.githubusercontent.com/u/16954412?v=4"
        end
      end
    end
  end

  private def github_events_script
    script type: "text/javascript" do
      raw %(
        GitHubActivity.feed({
          username: "mikeeus",
          selector: "#gh-event-feed",
          // limit: 20 // optional
          // repository: "", // optional
        });
      )
    end
  end
end

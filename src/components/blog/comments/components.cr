module Blog::Comments::Components
  # From: https://github.com/artsy/artsy.github.io/blob/source/_includes/gh_comments.html
  private def comments(comment_id)
    section id: "comments"
    script type: "text/javascript" do
      raw %(// Comes from https://stackoverflow.com/questions/3177836/how-to-format-time-since-xxx-e-g-4-minutes-ago-similar-to-stack-exchange-site
      function timeSince(date) {
        var seconds = Math.floor((new Date() - date) / 1000)
        var interval = Math.floor(seconds / 31536000)
        if (interval > 1) {
          return interval + " years"
        }
        interval = Math.floor(seconds / 2592000)
        if (interval > 1) {
          return interval + " months"
        }
        interval = Math.floor(seconds / 86400)
        if (interval > 1) {
          return interval + " days"
        }
        interval = Math.floor(seconds / 3600)
        if (interval > 1) {
          return interval + " hours"
        }
        interval = Math.floor(seconds / 60)
        if (interval > 1) {
          return interval + " minutes"
        }
        return Math.floor(seconds) + " seconds"
      }
      var writeToComment = function(element, html) {
        var element = document.createElement(element)
        element.innerHTML = html
        document.getElementById("comments").appendChild(element)
      }
      // Based on http://ivanzuzak.info/2011/02/18/github-hosted-comments-for-github-hosted-blogs.html
      // And http://donw.io/post/github-comments/
      var loadComments = function(data) {
        writeToComment("h2", "Comments")

        for (var i = 0; i < data.length; i++) {
          var cuser = data[i].user.login
          var cuserlink = data[i].user.html_url
          var clink = data[i].html_url
          var cbody = data[i].body_html
          var cavatarlink = data[i].user.avatar_url
          var cdate = new Date(data[i].created_at)
          var commentHTML =
            "<div class='comment'>" +
              "<div class='comment-header'>" +
                "<a class='comment-username' href='" + cuserlink + "'>'" +
                '<img src="' + cavatarlink + '" alt="" width="40" height="40">' +
                cuser +
                "</a>" + " commented " +
                "<a class='comment-date' href='" + clink + "'>'" +
                  timeSince(cdate) + " ago" +
                "</a>" +
              "</div>" +
              "<div class='comment-body'>"
                + cbody +
              "</div>"
            "</div>"
          writeToComment("div", commentHTML)
        }
        var callToAction =
          "<hr/>" +
          "<p>" +
            "Comments are using GitHub Issues on this blog's repo. You can post by replying to <a href='https://github.com/mikeeus/mikias/issues/#{comment_id}'>issue ##{comment_id}}</a>." +
          "</p>"
        writeToComment("div", callToAction)
      }
      var writeFirstComment = function() {
        var callToAction =
          "<hr/>" +
          "<p>" +
            "This post has no comments, yet, you could be the first! Comments are using GitHub Issues and you can post by replying to <a href='https://github.com/mikeeus/mikias/issues/#{comment_id}'>issue ##{comment_id}}</a>." +
          "</p>"
        writeToComment("div", callToAction)
      }
      if (window.fetch) {
        var url =
          "https://gh-commentify.herokuapp.com/repos/mikeeus/mikias/issues/#{comment_id}/comments"
        window
          .fetch(url, { Accept: "application/vnd.github.v3.html+json" })
          .then(function(response) {
            return response.json()
          })
          .then(function(json) {
            if(json.length) {
              loadComments(json)
            } else {
              writeFirstComment()
            }
          })
      })
    end
  end
end
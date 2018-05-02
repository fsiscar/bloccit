class FavoriteMailer < ApplicationMailer
  default from: "fsiscar@gmail.com"

  def new_comment(user, post, comment)
    headers["Message-ID"] = "<comments/#{comment.id}@shrouded-woodland-49260.herokuapp.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@shrouded-woodland-49260.herokuapp.com>"
    headers["References"] = "<post/#{post.id}@shrouded-woodland-49260.herokuapp.com>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
   end
end

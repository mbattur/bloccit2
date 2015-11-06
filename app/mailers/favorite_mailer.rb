class FavoriteMailer < ActionMailer::Base
   default from: "youremail.com"

   def new_comment(user, post, comment)

     headers["Message-ID"] = "<comments/#{comment.id}@aqueous-fortress-4895.herokuapp.com>"
     headers["In-Reply-To"] = "<post/#{post.id}@aqueous-fortress-4895.herokuapp.com>"
     headers["References"] = "<post/#{post.id}@aqueous-fortress-4895.herokuapp.com>"
 
     @user = user
     @post = post
     @comment = comment

     mail(to: user.email, subject: "New comment on #{post.title}")
   end
   
   def new_post(post)

     headers["Message-ID"] = "<comments/#{comment.id}@aqueous-fortress-4895.herokuapp.com>"
     headers["In-Reply-To"] = "<post/#{post.id}@aqueous-fortress-4895.herokuapp.com>"
     headers["References"] = "<post/#{post.id}@aqueous-fortress-4895.herokuapp.com>"
 
     @post = post

     mail(to: post.user.email, subject: "You're following, #{post.title}!")
   end
end
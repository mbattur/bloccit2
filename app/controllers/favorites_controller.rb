class FavoritesController < ApplicationController
   before_action :require_sign_in
 
   def create
     post = Post.find(params[:post_id])
     favorite = current_user.favorites.build(post: post)
     #finding the post to favorite using post_id
     #creating favorite to current user. creating associationg between the user, post, and favorite.
 
     if favorite.save
       flash[:notice] = "Post favorited."
     else
       flash[:error] = "Favoriting failed."
     end

     redirect_to [post.topic, post]
   end
   
   def destroy
       post = Post.find(params[:post_id])
       favorite = current_user.favorites.find(params[:id])
       #finding the post to favorite using post_id
       #checking if there is an associtation between the user who wants to unfavorite, post, and favorite. 
       
       if favorite.destroy
           flash[:notice] = "Post unfavorited."
       else
           flash[:error] = "Unfavoriting failed."
       end
           redirect_to [post.topic, post]
   end
end

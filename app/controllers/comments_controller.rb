class CommentsController < ApplicationController
    before_action :require_sign_in
    before_action :authorize_user, only: [:destroy]
    
    def destroy
        @post = Post.find(params[:post_id])
        #finding correct post by using :post_id
        #POST_ID IS CREATED SO THE COMMENTS CAN BELONG TO SPECIFIC POST. 
        #WE WILL HAVE NUMBER OF COMMENTS WITH SAME POST_ID
        #POST_ID WAS AUTOMATICAL CREATED IN THE COMMENT MODEL 
        #WHEN IT WAS GENERATED WITH POST:REFERENCES ARGUMENT
        comment = @post.comments.find(params[:id])
        #finding correct comment using :id
        #THIS ID WAS CREATED WHEN USER COMMENTED INITIALLY
        
        if comment.destroy
            flash[:notice] = "Comment was deleted."
            #if the comment is deleted flash notice informing the comment is deleted
            redirect_to [@post.topic, @post]
            #then redirect to the post.
            #THIS IS DUE TO NESTED POST PATH
        else
            flash[:error] = "Comment couldn't be deleted. Try again."
            #if the comment is not deleted flash error message
            redirect_to [@post.topic, @post]
            #then redirect the user to the post.
        end
    end
    
    def create
        @post = Post.find(params[:post_id])
        #finding correct post by using :post_id
        comment = @post.comments.new(comment_params)
        #the comment will be new comment
        comment.user = current_user
        #commenter should be signed in.
        #CORRECTION - ASSIGNING THE COMMENT.USER TO BE THE CURRENT_USER
        
        if comment.save
           flash[:notice] = "Comment saved successfully."
           redirect_to [@post.topic, @post]
           #if comment is saved flash notice informing that. then redirect to the post.
        else
            flash[:error] = "Comment failed to save"
            redirect_to [@post.topic, @post]
            #it comment is not saved flash error message and then riderct to the post. 
        end
    end
    
    private
    
    def comment_params
        params.require(:comment).permit(:body)
        #don't know what is this. 
        #STRONG PARAMETERS - PARAMATERS CANNOT BE USED AS MASS ASSIGNMENT UNTIL THEY ARE WHITELISTED. 
        #THIS FORCES US TO DECIDED WHICH ATTRIBUTES TO ALLOW FOR MASS UPDATE FOR SECURITY REASON
        #THIS PREVENTS US TO ACCIDENTLY ALLOW USERS TO UPDATE SENSITIVE MODEL ATTRIBUTES. 
        #WE USE REQUIRE AND PERMIT TO ALLOW ATTRIBUTES TO USE FOR MASS ASSIGNMENT. 
        #REQUIRE ENSURES THAT PARAMETER IS ALWAYS PRESENT
        #PERMIT DECLARES WHICH PARAMETERS TO ALLOW. 
    end
    
    def authorize_user
        comment = Comment.find(params[:id])
        unless current_user == comment.user || current_user.admin?
            flash[:error] = "You do not have permission to delete a comment."
            redirect_to [comment.post.topic, comment.post]
        end
        #defining the authorized user who can delete comment. 
        #finding the correct comment using :id
        #if the user is either comment author or admin they have permission to delete comment
        #if the user is neighter of these two flash error message then redirect them to the comment.
    end
end

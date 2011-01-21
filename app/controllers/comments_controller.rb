class CommentsController < ApplicationController
    
  before_filter :auth_admin_owner, :only => :destroy
  before_filter :authenticate_user!, :only => :create 
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    if @comment.save
      redirect_to({:controller => :home, :action => :show_news, :id => @post},  :notice => 'Nowy komentarz dodany')
    else
      redirect_to({:controller => :home, :action => :show_news, :id => @post})
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @comment = Comment.find(params[:comment_id])
    @comment.destroy 
    redirect_to(:controller => :home, :action => :show_news, :id => @post)
  end
  
  
 protected
 
   def auth_admin_owner
     @comment = Comment.find(params[:comment_id])
    if !( @comment.user_id == current_user.id || :authenticate_admin!)
      redirect_to new_user_session_path
    end
  end
end

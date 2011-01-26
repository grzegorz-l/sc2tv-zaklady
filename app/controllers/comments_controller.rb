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
  
  def edit
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])  
  end

  def update
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    if @comment.update_attributes(params[:comment])
      redirect_to({:controller => :home, :action => :show_news, :id => @post}, :notice => 'Komentarz został pomyślnie zaktualizowany.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @comment = Comment.find(params[:comment_id])
    @comment.destroy 
    redirect_to(:controller => :home, :action => :show_news, :id => @post)
  end
  
  
 protected
  # sprawdzamy czy jesteśmy właścicielem komentarza lub administratorem
   def auth_admin_owner
     @comment = Comment.find(params[:comment_id])
    if !( @comment.user_id == current_user.id || :authenticate_admin!)
      redirect_to new_user_session_path
    end
  end
end

class HomeController < ApplicationController
  def index
    @posts = Post.all.reverse
    @posts = @posts.paginate(:page => params[:page], :per_page => 8)
  end
  
  def show_news
    @user = current_user
    @post = Post.find(params[:id])
    @comments = @post.comments.reverse.paginate(:page => params[:page], :per_page => 5)
    @comment = @post.comments.build
  end
  
  def duels
    @duels = Duel.where(:finished => false).order("date ASC").paginate(:page => params[:page], :per_page => 5)
  end
  
  def arch_duels
    @duels = Duel.where(:finished => true).order("date ASC").reverse.paginate(:page => params[:page], :per_page => 5)
  end
  
  def show_duel
    @duel = Duel.find(params[:id])
    @time = Time.now.utc
  end
  
  def user_acc
    @user = current_user
  end
  
  def ranking
    @users = User.order("gold ASC").reverse
  end

  def suggest_duel
    @user = current_user
    @suggestion = Suggestion.new
  end
  
end

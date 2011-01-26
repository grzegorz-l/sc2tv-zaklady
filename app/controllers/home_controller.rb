class HomeController < ApplicationController

  # strona główna
  def index
    @posts = Post.all.reverse
    @posts = @posts.paginate(:page => params[:page], :per_page => 8)
  end

  # strona z konkretnym newsem
  def show_news
    @user = current_user
    @post = Post.find(params[:id])
    @comments = @post.comments.reverse.paginate(:page => params[:page], :per_page => 5)
    @comment = @post.comments.build
  end

  # strona z nie zakończonymi pojedynkami
  def duels
    @duels = Duel.where(:finished => false).order("date ASC").paginate(:page => params[:page], :per_page => 5)
  end

  # archiwum pojedynkow
  def arch_duels
    @duels = Duel.where(:finished => true).order("date ASC").reverse.paginate(:page => params[:page], :per_page => 5)
  end

  # konkretny pojedynek
  def show_duel
    @duel = Duel.find(params[:id])
    @time = Time.now.utc
  end

  # konto użytkownika
  def user_acc
    @user = current_user
  end

  # ranking graczy
  def ranking
    @users = User.order("gold ASC").reverse
  end
  
end

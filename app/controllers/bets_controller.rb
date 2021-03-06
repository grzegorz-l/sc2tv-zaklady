class BetsController < ApplicationController

  before_filter :find_duel, :find_user
  
  before_filter :auth_admin_owner, :except => [:new, :create, :index]
  
  before_filter :authenticate_user!, :only => [:new, :create]

  before_filter :check_date, :except => [:index, :show]

  
   def index
      if @user
        @bets = @user.bets
      else
        @bets = @duel.bets
        render :action => "index", :layout => "admin_panel"
      end
   end

  def new
    @user = current_user
    @bet = @duel.bets.build
  end
  
  def create
    @user = current_user
    @bet = @duel.bets.build(params[:bet])

    if @bet.save     
      @user.gold -= @bet.gold
      @user.save
      redirect_to({:controller => :home, :action => :show_duel, :id => @duel},  :notice => 'Nowy zaklad potwierdzony')
    else
      render :action => "new"
    end
    
  end
  
  def edit
    @bet = Bet.find(params[:id])
  end
  
  def show
    @bet = Bet.find(params[:id])
  end
  
  def update
    @bet = Bet.find(params[:id])
    @bet.update_attributes(params[:bet])
    redirect_to duel_bets_path(@duel)
  end
  
  def destroy
    @bet = Bet.find(params[:id])
    @bet.destroy 
    if @user
      redirect_to user_bets_path(@user)
    else
      redirect_to duel_bets_path(@duel)
    end
  end
  
protected
  # sprawdzanie czy jesteśmy zalogowaniu jako użytkownik lub administrator
  def auth_admin_owner
    @bet = Bet.find(params[:id])
    if !(@bet.user_id == current_user.id || :authenticate_admin!)
      redirect_to new_user_session_path
    end
  end
  # sprawdzanie czy pojedynek się jeszcze nie rozpoczął
  def check_date
    @duel = Duel.find(params[:duel_id])
    if @duel.date < Time.now then
      redirect_to :controller => :home, :action => :duels
    end
  end
  # jeśli parametrem jest duel_id to wyszukujemy pojedynek
  def find_duel
    @duel = Duel.find(params[:duel_id]) if params[:duel_id]
  end
 # jeśli parametrem jest user_id to wyszukujemy użytkownika
  def find_user
     @user = User.find(params[:user_id]) if params[:user_id]
 end

end
class BetsController < ApplicationController
  # GET /bets
  # GET /bets.xml
  before_filter :authenticate_user!, :find_duel, :find_user
  before_filter :check_date, :except => [:index, :show]
  
  
   def index
      if @user
        @bets = @user.bets
      else
        @bets = @duel.bets
      end
   end
  
  def new
   
    @user = current_user
    @bet = @duel.bets.build
  end
  
  def create
  
    @user = current_user
    @bet = @duel.bets.build(params[:bet])
    @bet.user_id = @user.id

    if @bet.save     
      @user.gold -= @bet.gold
      @user.save
      redirect_to duel_bets_path(@duel)
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
    if @duel
      redirect_to duel_bets_path(@duel) 
    else
      @user = current_user
      redirect_to user_bets_path(@user) 
    end
  end
  
protected
  
  def check_date
    @duel = Duel.find(params[:duel_id])
    if @duel.date < Time.now then
      redirect_to duel_bets_path(@duel)
    end
  end
  def find_duel
    @duel = Duel.find(params[:duel_id]) if params[:duel_id]
  end
 
  def find_user
     @user = User.find(params[:user_id]) if params[:user_id]
 end

end
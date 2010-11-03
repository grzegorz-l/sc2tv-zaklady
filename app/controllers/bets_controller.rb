class BetsController < ApplicationController
  # GET /bets
  # GET /bets.xml
  
  
   def index
    @duel = Duel.find(params[:duel_id])
    @bets = @duel.bets
  end
  
  def new
    @duel = Duel.find(params[:duel_id])
    @bet = @duel.bets.build
  end
  
  def create
    @duel = Duel.find(params[:duel_id])
    @bet = @duel.bets.build(params[:bet])
    if @bet.save
      redirect_to duel_bets_path(@duel)
    else
      render :action => "new"
    end
    
  end
  
  def edit
    @duel = Duel.find(params[:duel_id])
    @bet = Bet.find(params[:id])
  end
  
  def show
    @duel = Duel.find(params[:duel_id])
    @bet = Bet.find(params[:id])
  end
  
   def update
    @duel = Duel.find(params[:duel_id])
    @bet = Bet.find(params[:id])
    @bet.update_attributes(params[:bet])
    redirect_to duel_bets_path(@duel)
  end
  
  def destroy
      @duel = Duel.find(params[:duel_id])
      @bet = Bet.find(params[:id])
      @bet.destroy 
      redirect_to duel_bets_path(@duel) 
  end
end

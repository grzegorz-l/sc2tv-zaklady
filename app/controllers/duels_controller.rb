class DuelsController < ApplicationController
  before_filter :authenticate_admin!

  layout "admin_panel"
  
  def index
    @duels = Duel.order("date ASC")
  end

  def show
    @duel = Duel.find(params[:id])
  end

  def new
    @duel = Duel.new
  end

  def edit
    @duel = Duel.find(params[:id])
  end

  def create
    @duel = Duel.new(params[:duel])

    if @duel.save
      redirect_to(duels_path, :notice => 'Pojedynk został pomyślnie stworzony.')
    else
      render :action => "new"
    end
  end

  def update
    @duel = Duel.find(params[:id])

    if @duel.update_attributes(params[:duel])
      redirect_to(duels_path, :notice => 'Pojedynek został pomyślnie zaktualizowany.')
    else
      render :action => "edit"
    end
  end

  # strona na której administrator uzupełnia wynik pojedynku
  def result
    @duel = Duel.find(params[:id])
  end
  # akcja aktualizacji pojedynku
  def make_result
    @duel = Duel.find(params[:id])
    if @duel.update_attributes(params[:duel])
      redirect_to(duels_path, :notice => 'Pojedynek został pomyślnie zaktualizowany.')
    else
      render :action => :result 
    end
  end

  def destroy
    @duel = Duel.find(params[:id])
    @duel.destroy
      redirect_to(duels_path)
  end
  
end

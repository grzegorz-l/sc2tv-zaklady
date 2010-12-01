class AdminPanelController < ApplicationController
  before_filter :authenticate_admin!
  def index
   
  end

  def duels
    @duels = Duel.all
  end
end

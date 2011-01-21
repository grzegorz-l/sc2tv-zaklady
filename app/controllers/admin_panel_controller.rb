class AdminPanelController < ApplicationController
  before_filter :authenticate_admin!
  layout "admin_panel"
 
  def index
   
 end
 

end

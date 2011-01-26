class SuggestionsController < ApplicationController
 layout 'admin_panel'
 before_filter :authenticate_user!, :only => [:new, :create]
 before_filter :authenticate_admin!, :except => [:new, :create]




  def index
    @suggestions = Suggestion.all
  end

  def show
    @suggestion = Suggestion.find(params[:id])
  end


  def new
    @suggestion = Suggestion.new
    render :action => "new", :layout => "application"
  end

  def edit
    @suggestion = Suggestion.find(params[:id])
  end

  def create
    @suggestion = Suggestion.new(params[:suggestion])

    if @suggestion.save
      redirect_to({:controller => :home, :action => :index}, :notice => 'Sugestia została wysłana')
    else
      render :action => "new", :layout => "application"
    end
  end

  def destroy
    @suggestion = Suggestion.find(params[:id])
    @suggestion.destroy
    redirect_to(suggestions_path, :notice => 'Sugestia została usunięta')
  end
  
end

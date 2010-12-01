class DuelsController < ApplicationController
  before_filter :authenticate_admin!, :except => [:index, :show]
  # GET /duels
  # GET /duels.xml
  def index
    @duels = Duel.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @duels }
    end
  end

  # GET /duels/1
  # GET /duels/1.xml
  def show
    @duel = Duel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @duel }
    end
  end

  # GET /duels/new
  # GET /duels/new.xml
  def new
    @duel = Duel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @duel }
    end
  end

  # GET /duels/1/edit
  def edit
    @duel = Duel.find(params[:id])
  end

  # POST /duels
  # POST /duels.xml
  def create
    @duel = Duel.new(params[:duel])

    respond_to do |format|
      if @duel.save
        format.html { redirect_to(:controller => :admin_panel, :action => :duels, :notice => 'Duel was successfully created.') }
        format.xml  { render :xml => @duel, :status => :created, :location => @duel }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @duel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /duels/1
  # PUT /duels/1.xml
  def update
    @duel = Duel.find(params[:id])
    respond_to do |format|
      if @duel.update_attributes(params[:duel])
        format.html { redirect_to(:controller => :admin_panel, :action => :duels, :notice => 'Duel was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @duel.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /duels/1
  # DELETE /duels/1.xml
  def destroy
    @duel = Duel.find(params[:id])
    @duel.destroy

    respond_to do |format|
      format.html { redirect_to(:controller => :admin_panel, :action => :duels) }
      format.xml  { head :ok }
    end
  end
end

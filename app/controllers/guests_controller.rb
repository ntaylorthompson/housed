class GuestsController < ApplicationController
  
#  before_filter :get_show
  
  def get_show
    @show = Show.find(params[:show_id] )
  end
  
  def show
    get_show
    @guest = @show.guests.find(params[:id])
  end
  
  def new
    @show = Show.find(params[:show_id] )
    @guest = @show.guests.new
  end
  
  
  def create
    @show = Show.find(params[:show_id] )
    @guest = @show.guests.build(params[:guest])
    
    respond_to do |format|
      if @guest.save
        format.html { redirect_to root_path, notice: 'Your purchase was successful. Thanks!' }
      else
        format.html { render action: "new" }
      end
    end
  end
  
  def index
    @guests = Guest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @guests }
    end
  end 
  
  def thanks
  end
  
end

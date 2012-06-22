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

  def buy
    @show = Show.find(params[:show_id] )
    @guest = Guest.find(params[:id])
    @cost = @show.ticket_price * @guest.tickets_requested
  end
  
  def create
    @show = Show.find(params[:show_id] )
    @guest = @show.guests.build(params[:guest])
    
    respond_to do |format|
      if @guest.save
        format.html { redirect_to "/users/#{params[:user_id]}/shows/#{params[:show_id]}/guests/#{@guest.id}/buy", notice: 'Your purchase was successful. Thanks!' }
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
  
  def update
    get_show
    @guest = @show.guests.find(params[:id])

    respond_to do |format|
      if @guest.update_attributes(params[:guest])
        format.html { redirect_to [@show.user, @show, @guest], notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
end

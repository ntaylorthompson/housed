class GuestsController < ApplicationController
  
  def create
    @show = flash[:show]
    flash.delete(:show)
    @guest = @show.guests.build(params[:guest])
    
    
    respond_to do |format|
      if @guest.save
        format.html { redirect_to thanks_path, notice: 'Show was successfully created.' }
      else
        format.html { redirect_to thanks_path }
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

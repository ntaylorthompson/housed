class ShowsController < ApplicationController
  # GET /shows
  # GET /shows.json
  
  before_filter :signed_in_user, only: [:edit, :update, :destroy]
  before_filter :correct_user,   only: [:edit]
  before_filter :admin_user, only: [:index, :destroy]
  before_filter :show_empty?, only: [:edit]
 
    
  
  #THIS IS REALLY MESSY NOW
  before_filter :get_user, except: [:index, :index_admin, :edit]
  
  def get_user
    @user = User.find(params[:user_id])
  end

  def index
    if params[:search].present?      
      @user_location = params[:search]
      @current_location_human = @user_location
      @admin = 50
    else
      @admin = Admin.first.default_fan_travel_radius
      @user_location = [current_user.location.latitude, current_user.location.longitude]
      @current_location_human = current_user.location.address
    end 
    
    @locations = Location.includes(:show).show.near(@user_location, @admin)
  end

  def index_admin
    @shows = Show.all
  end    
#OLD INDEX - FOR NESTED ROUTES, MAY BE NEEDED SOMEWHERE
#  def index
#    @show = @user.shows.find(params[:id])
#    respond_to do |format|
 #     format.html # index.html.erb
  #    format.json { render json: @shows }
   # end
  #end

  # GET /shows/1
  # GET /shows/1.json
  def show
    @show = @user.shows.find(params[:id])
    @guests = @show.guests.count
#    @guest = @show.guests.build(params[:guest])
#    flash[:show] = @show
 #   flash.keep    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @show }
    end
  end

  # GET /shows/new
  # GET /shows/new.json
  def new
    @show = @user.shows.new
    @location = @show.build_location
    @host = @show.build_host    

 #   respond_to do |format|               taken out for Heroku
  #    format.html # new.html.erb
   #   format.json { render json: @show }
  #  end
  end



  # GET /shows/1/edit
  def edit
    @show = Show.find(params[:id])
  end

  # POST /shows
  # POST /shows.json
  def create
    @show = @user.shows.build(params[:show])
    @show.build_host(:email => params[:host][:email])
    @show.build_location(:address => params[:location][:address])
    web_string = (0...8).map{65.+(rand(25)).chr}.join
    @show.web_string = (web_string)
    
    respond_to do |format|
      if @show.save
#        Mailer.new_show(@user, @show).deliver
        format.html { redirect_to user_show_path(@user, @show), notice: 'Show was successfully created.' }
        format.json { render json: @show, status: :created, location: @show }
      else
        format.html { render action: "new" }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shows/1
  # PUT /shows/1.json
  def update
    @show = @user.shows.find(params[:id])

    respond_to do |format|
      if @show.update_attributes(params[:show]) and @show.location.update_attributes(address: params[:location][:address]) and @show.host.update_attributes(email: params[:host][:email])        
        if current_user.admin? 
          format.html { redirect_to [@user, @show], notice: 'Show was successfully updated.' }
        else 
          format.html { redirect_to [@user, @show], notice: 'Show was successfully updated.' }
        end
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shows/1
  # DELETE /shows/1.json
  def destroy
    @show = @user.shows.find(params[:id])
    @show.destroy

    respond_to do |format|
      format.html { redirect_to user_shows_url(current_user) }
      format.json { head :no_content }
    end
  end
  private

    def correct_user
      @show = current_user.shows.find_by_id(params[:id])
      redirect_to root_path if @show.nil?
    end
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
    
    def show_empty?
      show = Show.find(params[:id])
      redirect_to(:back) if show.tickets_sold > 0 unless current_user.admin?
    end
    
end

class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  before_filter :signed_in_user, 
                only: [:index, :edit, :update, :destroy, :following, :followers]
  before_filter :correct_user,   only: [:edit, :update, :show]
  before_filter :admin_user,     only: :destroy
  #before_filter :admin_user, only: :index

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @shows = @user.shows.where("date > ?", Time.now.end_of_day).paginate(:page => params[:page], :per_page => 5)
    @finished_shows = @user.shows.where(complete: nil, date: 10.years.ago..Time.now.yesterday)
    
    @money_owed = 0
    @total_fans = 0 
    @finished_shows.each do |i| 
      @money_owed += i.tickets_sold * i.ticket_price
      @total_fans += i.tickets_sold
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end
  

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    
    respond_to do |format|
      if @user.save
#        Mailer.user_signup(@user).deliver
        format.html { redirect_to welcome_path, notice: 'User was successfully created.' }
        format.json { render json: welcome_path, status: :created, location: welcome_path }
        sign_in(@user)
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def advanced_edit
  end

  

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  
  def sample
  end
  
  private
  
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
        
end

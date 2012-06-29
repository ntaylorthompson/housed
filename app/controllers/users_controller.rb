class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  before_filter :signed_in_user, only: [ :edit, :update, :destroy, ]                
  before_filter :correct_user,   only: [:edit, :update, :show]
  before_filter :admin_user,     only: [:destroy, :index, :admin_edit]


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
    cost_percentage = Admin.first.cost_percentage
    @user = User.find(params[:id])
    @shows = @user.shows.where("date > ?", Time.now.yesterday).paginate(:page => params[:page], :per_page => 5)
    @finished_shows = @user.shows.where(complete: nil, date: 10.years.ago..Time.now.yesterday)
    
    @money_owed = 0
    @total_fans = 0 
    @finished_shows.each do |i| 
      @money_owed += i.tickets_sold * i.ticket_price
      @total_fans += i.tickets_sold
    @money_owed *= (1- cost_percentage)
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new_musician
    @user = User.new
  end
  
  def new_fan
    @user = User.new
  end
  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  def admin_edit
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
#        sign_in(@user)
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
        if current_user.admin? 
          format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        else 
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
        end
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
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
  
  def signup
  end

  private       
  
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user) or current_user.admin?
    end

    
end


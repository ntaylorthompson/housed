class AvailabilitiesController < ApplicationController
  before_filter :get_user
  
  def get_user
    @user = User.find(params[:user_id]  )
  end
  
  # GET /availabilities
  # GET /availabilities.json
  def index
    @availabilities = @user.availabilities

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @availabilities }
    end
  end

  # GET /availabilities/1
  # GET /availabilities/1.json
  def show
    @availability = @user.availabilities.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @availability }
    end
  end

  # GET /availabilities/new
  # GET /availabilities/new.json
  def new
    @availability = @user.availabilities.new
    @location = @availability.build_location

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @availability }
    end
  end

  # GET /availabilities/1/edit
  def edit
    @availability = @user.availabilities.find(params[:id])
  end

  # POST /availabilities
  # POST /availabilities.json
  def create
    @availability = @user.availabilities.build(params[:availability])
    @availability.build_location(:address => params[:location][:address])

    respond_to do |format|
      if @availability.save
        format.html { redirect_to  user_availabilities_path(@user), notice: 'Availability was successfully created.' }
        format.json { render json:  user_availabilities_path(@user), status: :created, location: [@user, @availability] }
      else
        format.html { render action: "new" }
        format.json { render json: @availability.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /availabilities/1
  # PUT /availabilities/1.json
  def update
    @availability = @user.availabilities.find(params[:id])

    respond_to do |format|
      if @availability.update_attributes(params[:availability]) and @availability.location.update_attributes(:address => params[:location][:address])
        format.html { redirect_to  user_availabilities_path(@user), notice: 'Availability was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @availability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /availabilities/1
  # DELETE /availabilities/1.json
  def destroy
    @availability = @user.availabilities.find(params[:id])
    @availability.destroy

    respond_to do |format|
      format.html { redirect_to user_availabilities_path(@user) }
      format.json { head :no_content }
    end
  end
end

class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  require 'csv'
  # GET /users or /users.json
  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file",
        template:"users/index",
        page_size: 'A4',
        layout: "application",
        orientation: "Landscape",
        lowquality: true,
        zoom: 1,
        dpi: 75
      end
      format.csv do
        response.headers['Content-Type'] = 'text/csv'
        response.headers['Content-Disposition'] = "attachment; filename=users.csv"
        render template: "users/index"
      end
  end
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
    
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: [ "User was successfully created.", 1] }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice:["User was successfully updated.", 1]}
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice:[  "User was successfully destroyed.", 0] }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :dob)
    end
end

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/:id
  def show
    @hosted_matches = @user.hosted_matches
    @joined_matches = @user.joined_matches
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created successfully."
      redirect_to @user
    else
      flash.now[:alert] = "Error creating user."
      render :new
    end
  end

  # GET /users/:id/edit
  def edit; end

  # PATCH/PUT /users/:id
  def update
    if @user.update(user_params)
      flash[:notice] = "User updated successfully."
      redirect_to @user
    else
      flash.now[:alert] = "Error updating user."
      render :edit
    end
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    flash[:notice] = "User deleted successfully."
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You are registered."
      redirect_to root_path
    else
      flash[:alert] = "Error while register."
      render :new
    end

    def edit
    end

    def update
      if @user.update(user_params)
        flash[:notice] = "You:noticer profile was updated"
        redirect_to user_path(@user)
      else
        render :edit
      end
    end
  end

  private

  def user_params
    params.require(:user) .permit(:username, :password)
  end

  def set_user
    @user = User.find(params[:id])    
  end
end
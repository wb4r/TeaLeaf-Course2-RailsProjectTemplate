class UsersController < ApplicationController
  def create
    @user = User.new(params.require(:username).permit!)
    @user.username = "user_1"
  end
end
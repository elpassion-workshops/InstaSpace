class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :initialize_user

  def show
  end

  def follow
    current_user.follow @user
    redirect_to user_path(@user)
  end

  def unfollow
    current_user.unfollow @user
    redirect_to user_path(@user)
  end

  private

  def initialize_user
    @user = User.find(params[:id])   
  end

end

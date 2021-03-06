class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def index
    render :index
  end

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      redirect_to "/users/show"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end


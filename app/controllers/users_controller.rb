class UsersController < ApplicationController
  def login
    @username = user_params[:username]
    @user = User.find_by(username: @username)
    if @user
      render json: { message: 'Welcome back.', logged_in: true, reservations: @user.reservations, user: @user },
             status: :ok
    else
      render json: { message: 'User not found.', logged_in: false }, status: :not_found
    end
  end

  def signup
    @username = user_params[:username]
    @user = User.new(username: @username)
    if @user.valid?
      @user.save
      render json: { message: 'User has been created successfully!!', logged_in: true, user: @user }, status: :created
    else
      render json: { message: 'Something went wrong.', logged_in: false }, status: :not_acceptable
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end

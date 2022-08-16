class Api::V1::SessionsController < ApplicationController
  def login
    @user = User.find_by(username: params[:username])
    if @user
      render json: {
        user: @user
      }, status: :ok
    else
      render json: { error: 'Enter valid username and password' }, status: :unauthorized
    end
  end

  def register
    @user = User.new(user_params)
    if @user.save
      render json: {
        user: @user
      }, status: :ok
    else
      render json: { error: @user.errors }, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:full_name, :username, :email, :password, :password_confirmation)
  end
end

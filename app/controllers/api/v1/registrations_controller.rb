class Api::V1::RegistrationsController < ApplicationController
  def create
    user = User.create(
      full_name: params[:full_name],
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if user.valid?
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: {
          id: user.id,
          full_name: user.full_name,
          username: user.username,
          email: user.email,
          role: user.role
        }
      }, status: :created
    else
      render json: {
        status: :unprocessable_entity,
        errors: user.errors.full_messages
      }, status: :unprocessable_entity
    end
  end
end

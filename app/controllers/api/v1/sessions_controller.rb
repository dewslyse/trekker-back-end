require_relative 'current_user_concern'

class Api::V1::SessionsController < ApplicationController
  include CurrentUserConcern

  def create
    user = User.find_by(username: params[:username])
      .try(:authenticate, params[:password])

    if user.present?
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
        status: :unauthorized,
        errors: ['Invalid username or password']
      }, status: :unauthorized
    end
  end

  def logged_in
    if @current_user
      render json: {
        logged_in: true,
        user: @current_user
      }
    else
      render json: {
        logged_in: false
      }
    end
  end

  def logout
    reset_session
    render json: {
      status: :ok,
      logged_out: true
    }
  end
end

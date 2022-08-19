# require_relative 'current_user_concern'

class Api::V1::DestinationsController < ApplicationController
  before_action :set_destination, only: %i[show update destroy]
  include CurrentUserConcern

  # GET /destinations
  def index
    @destinations = Destination.all

    render json: @destinations
  end

  # GET /destinations/1
  def show
    render json: @destination
  end

  # POST /destinations
  def create
    @destination = Destination.new(destination_params)
    @destination.user_id = @current_user.id

    if @destination.save
      render json: @destination, status: :created
    else
      render json: @destination.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /destinations/1
  def update
    if @destination.update(destination_params)
      render json: @destination
    else
      render json: @destination.errors, status: :unprocessable_entity
    end
  end

  # DELETE /destinations/1
  def destroy
    @destination.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_destination
    @destination = Destination.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def destination_params
    # params.fetch(:destination, {})
    params.permit(:name, :description, :image_url, :city_name)
  end
end

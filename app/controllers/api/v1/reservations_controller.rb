require_relative 'current_user_concern'

class Api::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show update destroy]
  include Api::V1::CurrentUserConcern

  # GET /reservations
  def index
    @reservations = Reservation.all.where(user_id: @current_user.id)
    # @reservations = Reservation.all

    render json: @reservations
  end

  # GET /reservations/1
  def show
    render json: @reservation
  end

  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = @current_user.id

    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reservations/1
  def update
    if @reservation.update(reservation_params)
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reservations/1
  def destroy
    @reservation.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.permit(:start_date, :end_date, :fee, :destination_id)
  end
end

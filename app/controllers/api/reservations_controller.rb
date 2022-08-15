module Api
  class ReservationsController < ApplicationController
    before_action :authenticate_user!

    before_save :round_to_two_digits

    def index
      @reservations = Reservation.all
      render json: @reservations.order(created_at: :desc)
    end

    def round_to_two_digits
      fee.round(2)
    end
  end
end


module Api
  class ReservationsController < ApplicationController
    before_action :authenticate_user!

    before_save :round_to_two_digits

    def index
      render json: Reservation.all.order('created_at DESC')
    end

    def round_to_two_digits
      fee.round(2)
    end
  end
end


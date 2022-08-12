class ReservationsController < ApplicationController
  before_action :authenticate_user!

  before_save: round_to_two_digits

  def round_to_two_digits
    fee = fee.round(2)
  end
end

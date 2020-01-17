class BookingsController < ApplicationController
  before_action :authenticate_tutor!, only: :index
  def index
    @bookings = Booking.where('tutor_id = ?', current_tutor.id)
  end
end

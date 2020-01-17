class BookingsController < ApplicationController
  before_action :authenticate_tutor!, only: :index
  def index
    @bookings = Booking.all
  end
end

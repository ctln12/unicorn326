class BookingsController < ApplicationController
  before_action :authenticate_student!, only: :index
  def index
    @bookings = Booking.where('student_id = ?', current_student.id)
  end
end

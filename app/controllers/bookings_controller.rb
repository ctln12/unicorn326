class BookingsController < ApplicationController
  before_action :redirect_if_user_not_signed_in!, only: :index

  def index
    if current_tutor
      @bookings = Booking.where('tutor_id = ?', current_tutor.id)
    elsif current_student
      @bookings = Booking.where('student_id = ?', current_student.id)
    end
  end

  private

  def redirect_if_user_not_signed_in!
    redirect_to root_path unless tutor_signed_in? || student_signed_in?
  end
end

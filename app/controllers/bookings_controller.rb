class BookingsController < ApplicationController
  before_action :authenticate_or_redirect!, only: :index

  def index
    if current_tutor
      @bookings = Booking.where('tutor_id = ?', current_tutor.id)
    elsif current_student
      @bookings = Booking.where('student_id = ?', current_student.id)
    end
  end

  private

  def authenticate_or_redirect!
    if current_tutor
      :authenticate_tutor!
    elsif current_student
      :authenticate_student!
    else
      redirect_to root_path
    end
  end
end

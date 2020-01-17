class BookingsController < ApplicationController
  def index
    if current_tutor
      @bookings = Booking.where('tutor_id = ?', current_tutor.id)
    elsif current_student
      @bookings = Booking.where('student_id = ?', current_student.id)
    end
  end
end

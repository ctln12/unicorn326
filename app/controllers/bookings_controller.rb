class BookingsController < ApplicationController
  before_action :redirect_if_user_not_signed_in!, only: :index

  def index
    if current_tutor
      @bookings = Booking.where('tutor_id = ?', current_tutor.id)
    elsif current_student
      @bookings = Booking.where('student_id = ?', current_student.id)
    end
  end

  def new
    @student = current_student
    @tutor = Tutor.find(params[:tutor_id])
    @booking = Booking.new
  end

  def create
    # date = DateTime.new(params[:booking]['date(1i)'].to_i, params[:booking]['date(2i)'].to_i, params[:booking]['date(3i)'].to_i, params[:booking]['date(4i)'].to_i, params[:booking]['date(5i)'].to_i)
    # duration = params['duration(4i)'].to_i*60 + params['duration(5i)'].to_i
    # @booking = Booking.new(student_id: params[:booking][:student_id].to_i, tutor_id: params[:booking][:tutor_id].to_i, subject_id: params[:booking][:subject_id].to_i, date: date, duration: duration, booking_price: params[:booking][:booking_price].to_f)
    @booking = Booking.new(booking_params)
    @booking.save

    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:student_id, :tutor_id, :subject_id, :date, :duration, :booking_price)
  end

  def redirect_if_user_not_signed_in!
    redirect_to root_path unless tutor_signed_in? || student_signed_in?
  end
end

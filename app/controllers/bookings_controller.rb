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
    @booking = Booking.new(booking_without_duration_params)
    duration = booking_duration_params[:'duration(4i)'].to_i * 60 + booking_duration_params[:'duration(5i)'].to_i
    @booking.duration = duration
    @booking.save

    redirect_to bookings_path
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def edit
    @booking = Booking.find(params[:id])
    @tutor = @booking.tutor
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_without_duration_params)

    redirect_to bookings_path
  end

  private

  def booking_duration_params
    params.require(:booking).permit(:duration)
  end

  def booking_without_duration_params
    params.require(:booking).permit(:student_id, :tutor_id, :subject_id, :language_id, :date, :booking_price)
  end

  def redirect_if_user_not_signed_in!
    redirect_to root_path unless tutor_signed_in? || student_signed_in?
  end
end

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
    @tomorrow = DateTime.now + 1.day
    @plus_one_hour = @tomorrow + 1.hour
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
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
    @booking.update(booking_params)

    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:student_id, :tutor_id, :subject_id, :language_id, :start_date, :end_date, :booking_price, :canceled_at, :accepted_at, :paid_at)
  end

  def redirect_if_user_not_signed_in!
    redirect_to root_path unless tutor_signed_in? || student_signed_in?
  end
end

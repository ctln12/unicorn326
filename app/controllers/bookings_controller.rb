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

    if @booking.go_payment
      stripe
    else
      redirect_to bookings_path
    end
  end

  private

  def stripe
    @booking = Booking.find(params[:id])
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: "#{@booking.tutor.first_name} #{@booking.tutor.last_name[0]}",
        images: ['https://unsplash.com/photos/fKyOE5xtnik'],
        amount: (@booking.booking_price * 100).to_i,
        currency: Currency.find(@booking.tutor.currency_id).name,
        quantity: 1
      }],

      success_url: booking_url(@booking),
      cancel_url: booking_url(@booking)
    )
    @booking.update(checkout_session_id: session.id, go_payment: false)
    redirect_to new_booking_payment_path(@booking)
  end

  def booking_params
    params.require(:booking).permit(:student_id, :tutor_id, :subject_id, :language_id, :start_date, :end_date, :booking_price, :canceled_at, :accepted_at, :paid_at, :go_payment)
  end

  def redirect_if_user_not_signed_in!
    redirect_to root_path unless tutor_signed_in? || student_signed_in?
  end
end

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
    @tutor = Tutor.find(params[:tutor_id])
    @booking = Booking.new
  end

  def create
    @tutor = Tutor.find(params[:tutor_id])
    @booking = Booking.new(booking_params)
    @booking.tutor = @tutor
    @booking.student = current_student
    @booking.booking_price = @tutor.price
    if @booking.save
      @chat = Chat.new(student: @booking.student, tutor: @booking.tutor)
      @chat.save
      redirect_to bookings_path
    else
      flash.now[:alert] = 'Please fill in all the required fields'
      render "new"
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @lesson = @booking.lesson
    @chat = Chat.where(student_id: @booking.student.id).where(tutor_id: @booking.tutor.id).first
  end

  def edit
    @booking = Booking.find(params[:id])
    @tutor = @booking.tutor
  end

  def update
    @booking = Booking.find(params[:id])
    raise
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
        description: "1 Lesson of #{@booking.subject.name}",
        images: ['https://images.unsplash.com/photo-1592332280537-70d3142bd01a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'],
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
    params.require(:booking).permit(:subject_id, :language_id, :start_date, :end_date)
  end

  def redirect_if_user_not_signed_in!
    redirect_to root_path unless tutor_signed_in? || student_signed_in?
  end
end

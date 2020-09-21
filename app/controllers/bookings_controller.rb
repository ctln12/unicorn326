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
    @booking.booking_price = @tutor.price * (@booking.end_time - @booking.start_time) / 3600
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
    @chat = Chat.where(student_id: @booking.student.id).where(tutor_id: @booking.tutor.id).first
    @booking_action = get_action(@booking)
  end

  def edit
    @booking = Booking.find(params[:id])
    @booking.date = @booking.date.strftime("%A %d %B %Y")
    @booking.start_time = @booking.start_time.strftime("%H:%M")
    @booking.end_time = @booking.end_time.strftime("%H:%M")
    @tutor = @booking.tutor
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    @booking.booking_price = @booking.tutor.price * (@booking.end_time - @booking.start_time) / 3600
    @booking.save
    redirect_to booking_path(@booking)
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.accepted_at = DateTime.now
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render "show"
    end
  end

  def pay
    @booking = Booking.find(params[:id])
    @booking.go_payment = true
    @booking.save

    if @booking.go_payment
      stripe
    else
      redirect_to bookings_path
    end
  end

  def cancel
    @booking = Booking.find(params[:id])
    @booking.canceled_at = DateTime.now
    if @booking.save
      redirect_to booking_path(@booking)
    else
      flash.now[:alert] = "You can't cancel a lesson on too short notice"
      render "show"
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
    @booking.update(checkout_session_id: session.id, go_payment: false, paid_at: DateTime.now)
    redirect_to new_booking_payment_path(@booking)
  end

  def booking_params
    params.require(:booking).permit(:subject_id, :language_id, :date, :start_time, :end_time)
  end

  def get_action(booking)
    if booking.status[:class] == "unconfirmed" && current_tutor
      "Accept request"
    elsif booking.status[:class] == "unpaid" && current_student
      "Pay now"
    elsif booking.status[:class] == "today"
      "Go to lesson"
    elsif booking.status[:class] == "completed"
      "View documents"
    elsif booking.status[:class] == "canceled" && current_student
      "Book new lesson"
    end
  end

  def redirect_if_user_not_signed_in!
    redirect_to root_path unless tutor_signed_in? || student_signed_in?
  end
end

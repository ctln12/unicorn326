class LessonsController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])

    if @booking.lesson
      redirect_to booking_lesson_path(@booking, @booking.lesson)
    else
      @lesson = Lesson.new
      @lesson.booking = @booking
      if @lesson.save
        redirect_to booking_lesson_path(@booking, @lesson)
      else
        redirect_to booking_path(@booking)
      end
    end
  end

  def show
    @lesson = Lesson.find(params[:id])

    opentok = OpenTok::OpenTok.new(ENV['OPENTOK_API_KEY'], ENV['OPENTOK_SECRET_KEY'])
    @opentok_token = opentok.generate_token(@lesson.opentok_session_id)
  end
end

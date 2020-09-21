require 'opentok'

class LessonsController < ApplicationController
    before_action :config_opentok, only: :create

  def create
    @booking = Booking.find(params[:booking_id])

    if @booking.lesson
      redirect_to booking_lesson_path(@booking, @booking.lesson)
    else
      @lesson = Lesson.new()
      @lesson.booking = @booking
      session = @opentok.create_session
      opentok_session_id = session.session_id
      @lesson.opentok_session_id = opentok_session_id
      opentok_token = @opentok.generate_token(opentok_session_id)
      @lesson.opentok_token = opentok_token
      if @lesson.save
        redirect_to booking_lesson_path(@booking, @lesson)
      else
        render "bookings/show"
      end
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
    @opentok_session_id = @lesson.opentok_session_id
    @opentok_token = @lesson.opentok_token
  end

  private

  def config_opentok
    if @opentok.nil?
      @opentok = OpenTok::OpenTok.new(ENV['OPENTOK_API_KEY'], ENV['OPENTOK_SECRET_KEY'])
    end
  end

  def lesson_params
    params.require(:lesson).permit(:video_url, :booking_id)
  end
end

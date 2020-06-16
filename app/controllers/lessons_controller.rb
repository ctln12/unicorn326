require 'opentok'

class LessonsController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @lesson = Lesson.new()
    @lesson.booking = @booking

    if @lesson.save
      redirect_to booking_lesson_path(@booking, @lesson)
    else
      redirect_to booking_path(@booking)
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
    # @opentok_session_id = @lesson.opentok_session_id
    # @opentok_token = @lesson.opentok_token

    opentok = OpenTok::OpenTok.new(ENV['OPENTOK_API_KEY'], ENV['OPENTOK_SECRET_KEY'])
    session = opentok.create_session
    @opentok_session_id = session.session_id
    @opentok_token = opentok.generate_token(@opentok_session_id)
  end

  private

  def lesson_params
    params.require(:lesson).permit(:video_url, :booking_id)
  end
end

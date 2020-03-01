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
  end

  private

  def lesson_params
    params.require(:lesson).permit(:video_url, :booking_id)
  end
end

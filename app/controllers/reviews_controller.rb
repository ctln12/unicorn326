class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    if @review.save
      redirect_to tutor_path(@booking.tutor)
    else
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end

class PaymentsController < ApplicationController
  def new
    @booking = bookings.where(paid_at: 'nil').find(params[:booking_id])
  end
end

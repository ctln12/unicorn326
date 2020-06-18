class StripeCheckoutSessionService
  def call(event)
    booking = Booking.find_by(checkout_session_id: event.data.object.id)
    wallet = Wallet.find_by(tutor_id: booking.tutor_id)
    booking.update(paid_at: DateTime.now) && wallet.update(amount: wallet.amount + booking.booking_price)
  end
end

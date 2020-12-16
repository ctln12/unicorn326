class WalletsController < ApplicationController
  def show
    @tutor = Tutor.find(params[:tutor_id])
    @bookings = @tutor.bookings.where.not(paid_at: nil)
    @wallet = Wallet.find(params[:id])
    bookings_total = @bookings.map do |booking|
      booking.booking_price
    end
    # change logic for wallet
    @wallet.amount = bookings_total.sum
    @wallet.save
  end

  def update
    @wallet = Wallet.find(params[:id])
    @wallet.update(wallet_params)
  end

  private

  def wallet_params
    params.require(:wallet).permit(:amount)
  end
end

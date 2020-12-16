class WalletsController < ApplicationController
  def show
    @tutor = Tutor.find(params[:tutor_id])
    @bookings = @tutor.bookings.where.not(paid_at: nil).order(date: :desc)
    @wallet = Wallet.find(params[:id])
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

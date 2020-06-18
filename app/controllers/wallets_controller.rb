class WalletsController < ApplicationController
  def show
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

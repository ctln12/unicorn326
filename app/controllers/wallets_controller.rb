class WalletsController < ApplicationController
  def show
    @wallet = Wallet.find(params[:id])
  end

  private

  def wallet_params
    params.require(:wallet).permit(:amount)
  end
end

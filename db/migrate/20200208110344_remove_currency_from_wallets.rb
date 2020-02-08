class RemoveCurrencyFromWallets < ActiveRecord::Migration[5.2]
  def change
    remove_column :wallets, :currency
  end
end

class ChangeReferencesFromWallets < ActiveRecord::Migration[5.2]
  def change
    remove_reference :wallets, :currency, foreign_key: true
    add_reference :wallets, :tutor, foreign_key: true
  end
end

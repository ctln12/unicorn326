class AddWalletsToTutors < ActiveRecord::Migration[5.2]
  def change
    add_reference :tutors, :wallets, foreign_key: true
  end
end

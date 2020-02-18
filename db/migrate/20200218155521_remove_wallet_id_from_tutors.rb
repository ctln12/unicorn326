class RemoveWalletIdFromTutors < ActiveRecord::Migration[5.2]
  def change
    remove_reference :tutors, :wallet, foreign_key: true
  end
end

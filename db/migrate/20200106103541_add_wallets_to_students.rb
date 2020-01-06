class AddWalletsToStudents < ActiveRecord::Migration[5.2]
  def change
    add_reference :students, :wallets, foreign_key: true
  end
end

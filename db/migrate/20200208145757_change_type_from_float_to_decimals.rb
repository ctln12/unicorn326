class ChangeTypeFromFloatToDecimals < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :booking_price, :decimal
    change_column :job_posts, :price, :decimal
    change_column :tutors, :price, :decimal
    change_column :wallets, :amount, :decimal
  end
end

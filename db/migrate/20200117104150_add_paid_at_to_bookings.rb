class AddPaidAtToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :paid_at, :date
  end
end

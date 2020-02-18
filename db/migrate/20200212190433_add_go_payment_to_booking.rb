class AddGoPaymentToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :go_payment, :boolean
  end
end

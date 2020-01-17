class AddSubjectToBookings < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :subject, foreign_key: true
  end
end

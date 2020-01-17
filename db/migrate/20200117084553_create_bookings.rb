class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :student, foreign_key: true
      t.references :tutor, foreign_key: true
      t.date :canceled_at
      t.date :date
      t.date :duration
      t.float :booking_price
      t.date :accepted_at

      t.timestamps
    end
  end
end

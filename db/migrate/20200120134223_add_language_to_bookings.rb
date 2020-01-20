class AddLanguageToBookings < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :language, foreign_key: true
  end
end

class ChangeTypeOfDurationInBookings < ActiveRecord::Migration[5.2]
  def change
        change_column :bookings, :duration, :time
  end
end

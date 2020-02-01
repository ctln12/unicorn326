class RenameColumnDurationInBookings < ActiveRecord::Migration[5.2]
  def change
    rename_column :bookings, :duration, :end_date
  end
end

class RemoveCurrencyFromTutors < ActiveRecord::Migration[5.2]
  def change
    remove_column :tutors, :currency
  end
end

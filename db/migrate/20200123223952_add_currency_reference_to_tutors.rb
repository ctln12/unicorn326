class AddCurrencyReferenceToTutors < ActiveRecord::Migration[5.2]
  def change
    add_reference :tutors, :currency, foreign_key: true
  end
end

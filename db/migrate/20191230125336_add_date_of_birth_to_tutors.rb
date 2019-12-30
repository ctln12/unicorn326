class AddDateOfBirthToTutors < ActiveRecord::Migration[5.2]
  def change
    add_column :tutors, :date_of_birth, :date
  end
end

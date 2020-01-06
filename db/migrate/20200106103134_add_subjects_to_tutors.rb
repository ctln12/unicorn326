class AddSubjectsToTutors < ActiveRecord::Migration[5.2]
  def change
    add_reference :tutors, :subjects, foreign_key: true
  end
end

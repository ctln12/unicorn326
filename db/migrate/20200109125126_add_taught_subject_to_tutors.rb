class AddTaughtSubjectToTutors < ActiveRecord::Migration[5.2]
  def change
    add_reference :tutors, :taught_subject, foreign_key: true
  end
end

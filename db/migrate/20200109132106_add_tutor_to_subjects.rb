class AddTutorToSubjects < ActiveRecord::Migration[5.2]
  def change
    add_reference :subjects, :tutor, foreign_key: true
  end
end

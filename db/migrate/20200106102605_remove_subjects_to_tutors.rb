class RemoveSubjectsToTutors < ActiveRecord::Migration[5.2]
  def change
    remove_column :tutors, :subjects, :string
    remove_column :tutors, :spoken_languages, :string
  end
end

class RemoveFieldsToTutors < ActiveRecord::Migration[5.2]
  def change
    remove_column :tutors, :subjects_id
    remove_column :tutors, :spoken_languages_id
  end
end

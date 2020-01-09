class RemoveColumnsFromTutors < ActiveRecord::Migration[5.2]
  def change
    remove_column :tutors, :subjects
    remove_column :tutors, :spoken_languages
  end
end

class AddSpokenLanguagesToTutors < ActiveRecord::Migration[5.2]
  def change
    add_reference :tutors, :spoken_languages, foreign_key: true
  end
end

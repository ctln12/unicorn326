class AddReferencesToSpokenLanguages < ActiveRecord::Migration[5.2]
  def change
    add_reference :spoken_languages, :tutor, foreign_key: true
    add_reference :spoken_languages, :student, foreign_key: true
  end
end

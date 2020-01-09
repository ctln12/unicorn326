class RemoveNameFromSpokenLanguages < ActiveRecord::Migration[5.2]
  def change
    remove_column :spoken_languages, :name
  end
end

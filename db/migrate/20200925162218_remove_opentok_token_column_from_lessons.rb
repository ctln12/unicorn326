class RemoveOpentokTokenColumnFromLessons < ActiveRecord::Migration[5.2]
  def change
    remove_column :lessons, :opentok_token, :string
  end
end

class AddOpentokCredentialsToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :opentok_session_id, :string
    add_column :lessons, :opentok_token, :string
  end
end

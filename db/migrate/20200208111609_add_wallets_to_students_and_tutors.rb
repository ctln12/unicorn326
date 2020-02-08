class AddWalletsToStudentsAndTutors < ActiveRecord::Migration[5.2]
  def change
    add_reference :tutors, :wallet, foreign_key: true
    add_reference :students, :wallet, foreign_key: true
  end
end

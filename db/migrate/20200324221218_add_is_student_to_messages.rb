class AddIsStudentToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :is_student, :boolean
  end
end

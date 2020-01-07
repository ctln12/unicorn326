class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.references :tutor, foreign_key: true
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end

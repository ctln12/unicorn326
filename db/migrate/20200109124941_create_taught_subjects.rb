class CreateTaughtSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :taught_subjects do |t|
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end

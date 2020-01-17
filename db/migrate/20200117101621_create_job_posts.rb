class CreateJobPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :job_posts do |t|
      t.references :student, foreign_key: true
      t.string :description
      t.float :amount
      t.string :subjects
      t.string :spoken_languages

      t.timestamps
    end
  end
end

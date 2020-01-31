class AddReferencesToJobPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :job_posts, :subject, foreign_key: true
    add_reference :job_posts, :language, foreign_key: true
  end
end

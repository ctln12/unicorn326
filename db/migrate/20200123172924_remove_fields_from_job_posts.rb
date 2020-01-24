class RemoveFieldsFromJobPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :job_posts, :subjects
    remove_column :job_posts, :spoken_languages
  end
end

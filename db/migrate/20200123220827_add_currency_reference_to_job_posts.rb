class AddCurrencyReferenceToJobPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :job_posts, :currency, foreign_key: true
  end
end

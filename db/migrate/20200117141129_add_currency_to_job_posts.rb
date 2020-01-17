class AddCurrencyToJobPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :job_posts, :currency, :string
  end
end

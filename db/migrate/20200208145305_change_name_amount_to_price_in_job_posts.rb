class ChangeNameAmountToPriceInJobPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :job_posts, :amount, :price
  end
end

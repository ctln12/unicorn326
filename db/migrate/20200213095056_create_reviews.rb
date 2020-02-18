class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :comment
      t.references :booking, foreign_key: true
      t.integer :rating

      t.timestamps
    end
  end
end

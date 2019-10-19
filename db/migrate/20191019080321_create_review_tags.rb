class CreateReviewTags < ActiveRecord::Migration[5.2]
  def change
    create_table :review_tags do |t|
      t.integer :review_id
      t.integer :tag_id

      t.timestamps
    end
    add_index :review_tags, :review_id
    add_index :review_tags, :tag_id
    add_index :review_tags, [:review_id,:tag_id]
  end
end

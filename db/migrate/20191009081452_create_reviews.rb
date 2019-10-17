class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :text
      t.string :ski_field_name
      t.integer :user_id
      t.float :rate
      t.integer :likes_count

      t.timestamps
    end
  end
end

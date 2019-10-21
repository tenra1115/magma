class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name

      t.timestamps
    end
    # データの読み込み・取得が早くなる。
    add_index :tags, :name
  end
end

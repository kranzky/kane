class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'citext'
    create_table :posts do |t|
      t.integer :statistics_count, null: false, default: 0
      t.references :user, null: false, index: true
      t.references :content, index: true
      t.citext :url, null: false
      t.integer :position
      t.timestamp :posted_at
      t.timestamps
    end
    add_foreign_key :posts, :users
    add_foreign_key :posts, :contents
    add_index :posts, :url
  end
end

class CreateContents < ActiveRecord::Migration[5.0]
  def up
    enable_extension 'citext'
    execute <<-SQL
      CREATE TYPE content_access AS ENUM ('native', 'external', 'premium', 'banned');
    SQL
    create_table :contents do |t|
      t.integer :posts_count, null: false, default: 0
      t.references :source, null: false, index: true
      t.citext :url, null: false
      t.text :title, null: false, default: ""
      t.text :description, null: false, default: ""
      t.text :body, null: false, default: ""
      t.citext :thumbnail
      t.text :language
      t.text :tags, array: true, default: []
      t.column :access, :content_access, null: false, default: "native"
      t.timestamp :published_at
      t.timestamps
    end
    add_foreign_key :contents, :sources
    add_index :contents, :url, unique: true
    create_join_table :contents, :authors
  end
  def down
    drop_join_table :contents, :authors
    drop_table :contents
    execute <<-SQL
      DROP TYPE content_access;
    SQL
  end
end

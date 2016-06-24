class CreateContents < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      CREATE TYPE content_access AS ENUM ('native', 'external', 'premium', 'banned');
    SQL
    create_table :contents do |t|
      t.text :url, null: false
      t.text :title, default: ""
      t.text :description, default: ""
      t.text :body, null: false
      t.text :thumbnail
      t.text :language
      t.text :tags, array: true, default: []
      t.column :access, :content_access, null: false, default: "native"
      t.timestamp :published_at
      t.timestamps
    end
    add_index :contents, :url, unique: true
  end
  def down
    drop_table :contents
    execute <<-SQL
      DROP TYPE content_access;
    SQL
  end
end

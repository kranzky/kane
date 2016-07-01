class CreateSources < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'citext'
    create_table :sources do |t|
      t.integer :contents_count, null: false, default: 0
      t.citext :name, null: false
      t.citext :url, null: false
      t.citext :favicon, null: false
      t.timestamps
    end
    add_index :sources, :name, unique: true
    add_index :sources, :url, unique: true
  end
end

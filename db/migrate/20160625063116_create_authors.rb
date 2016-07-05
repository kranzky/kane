class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'citext'
    create_table :authors do |t|
      t.citext :name, null: false
      t.citext :url
      t.timestamps
    end
    add_index :authors, :name, unique: true
    add_index :authors, :url, unique: true, allow_nil: true
  end
end

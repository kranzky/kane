class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'citext'
    create_table :authors do |t|
      t.citext :name, null: false
      t.citext :url
      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'citext'
    create_table :users do |t|
      t.integer :posts_count, null: false, default: 0
      t.integer :statistics_count, null: false, default: 0
      t.citext :name, null: false
      t.timestamps
    end
    add_index :users, :name, unique: true
  end
end

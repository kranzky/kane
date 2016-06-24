class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'citext'
    create_table :users do |t|
      t.citext :name, null: false
      t.timestamps
    end
    add_index :users, :name, unique: true
  end
end

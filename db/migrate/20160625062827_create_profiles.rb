class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'citext'
    create_table :profiles do |t|
      t.references :user, null: false, index: true
      t.citext :name
      t.timestamps
    end
    add_foreign_key :profiles, :users
  end
end

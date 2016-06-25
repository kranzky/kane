class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'citext'
    create_table :profiles do |t|
      t.references :user, null: false
      t.citext :name
      t.timestamps
    end
  end
end

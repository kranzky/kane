class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.references :user, null: false
      t.boolean :subscribed, null: false, default: false
      t.integer :credits, null: false, default: 0
      t.text :timezone
      t.timestamps
    end
  end
end

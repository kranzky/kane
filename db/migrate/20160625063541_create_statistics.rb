class CreateStatistics < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      CREATE TYPE statistic_state AS ENUM ('none', 'saved', 'deleted');
    SQL
    create_table :statistics do |t|
      t.references :user, null: false
      t.references :post, null: false
      t.citext :reaction
      t.column :state, :statistic_state, null: false, default: "none"
      t.integer :seen_count, null: false, default: 0
      t.integer :view_count, null: false, default: 0
      t.integer :view_seconds, null: false, default: 0
      t.integer :view_percent, null: false, default: 0
      t.timestamps
    end
  end
  def down
    drop_table :statistics
    execute <<-SQL
      DROP TYPE statistic_state;
    SQL
  end
end

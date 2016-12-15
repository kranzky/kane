class AddImagesToContent < ActiveRecord::Migration[5.0]
  def change
    add_column :contents, :images, :jsonb, null: false, default: "{}"
  end
end

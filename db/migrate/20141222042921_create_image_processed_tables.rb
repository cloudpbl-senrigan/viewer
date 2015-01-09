class CreateImageProcessedTables < ActiveRecord::Migration
  def change
    create_table :image_processed_tables do |t|
      t.string "path"
      t.integer  "x"
      t.integer  "y"
      t.integer  "z"
      t.datetime "create_date"
      t.datetime "taken_date"
      t.integer  "theta"
      t.integer "height"
      t.integer "width"
      t.integer "source_image_ids"
    end
    add_index :image_processed_tables, [:x, :y, :z, :theta, :height], :unique => true
  end
end

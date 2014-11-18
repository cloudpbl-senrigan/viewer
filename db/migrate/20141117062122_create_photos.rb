class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :path
      t.integer :x
      t.integer :y
      t.integer :z
      t.float :theta

      t.timestamps
    end
  end
end

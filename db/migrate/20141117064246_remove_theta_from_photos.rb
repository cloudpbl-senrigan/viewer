class RemoveThetaFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :theta, :float
  end
end

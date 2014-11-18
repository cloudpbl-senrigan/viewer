class AddThetaToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :theta, :integer
  end
end

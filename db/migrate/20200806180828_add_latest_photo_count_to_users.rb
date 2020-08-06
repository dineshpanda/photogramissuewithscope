class AddLatestPhotoCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :latest_photos_count, :integer
  end
end

class RemoveThumbnailFromPodcasts < ActiveRecord::Migration
  def change
    remove_column :podcasts, :thumbnail, :string
  end
end

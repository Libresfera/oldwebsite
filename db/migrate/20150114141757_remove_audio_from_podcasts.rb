class RemoveAudioFromPodcasts < ActiveRecord::Migration
  def change
    remove_column :podcasts, :audio, :string
  end
end

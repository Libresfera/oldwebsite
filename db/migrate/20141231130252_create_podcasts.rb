class CreatePodcasts < ActiveRecord::Migration
  def change
    create_table :podcasts do |t|
      t.string :title
      t.text :description
      t.string :thumbnail
      t.string :audio

      t.timestamps
    end
  end
end

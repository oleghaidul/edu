class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :yt_video_id
      t.boolean :is_complete, :default => false

      t.timestamps
    end
  end
end

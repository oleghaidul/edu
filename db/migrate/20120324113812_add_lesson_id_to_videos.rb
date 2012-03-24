class AddLessonIdToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :lesson_id, :integer

  end
end

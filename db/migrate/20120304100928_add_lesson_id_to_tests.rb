class AddLessonIdToTests < ActiveRecord::Migration
  def change
    add_column :tests, :lesson_id, :integer

  end
end

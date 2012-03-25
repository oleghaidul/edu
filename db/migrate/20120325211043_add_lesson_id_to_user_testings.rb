class AddLessonIdToUserTestings < ActiveRecord::Migration
  def change
    add_column :user_testings, :lesson_id, :integer

  end
end

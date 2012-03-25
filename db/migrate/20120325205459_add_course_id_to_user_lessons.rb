class AddCourseIdToUserLessons < ActiveRecord::Migration
  def change
    add_column :user_lessons, :course_id, :integer

  end
end

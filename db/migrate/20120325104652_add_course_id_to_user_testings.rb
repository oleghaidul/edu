class AddCourseIdToUserTestings < ActiveRecord::Migration
  def change
    add_column :user_testings, :course_id, :integer

  end
end

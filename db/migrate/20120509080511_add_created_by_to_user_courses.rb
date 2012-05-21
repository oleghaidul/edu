class AddCreatedByToUserCourses < ActiveRecord::Migration
  def change
    add_column :user_courses, :created_by_id, :integer

  end
end

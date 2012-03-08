class CreateUserCourses < ActiveRecord::Migration
  def change
    create_table :user_courses do |t|
      t.integer :course_id
      t.integer :user_id
      t.boolean :passed

      t.timestamps
    end
  end
end

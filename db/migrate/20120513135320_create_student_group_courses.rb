class CreateStudentGroupCourses < ActiveRecord::Migration
  def change
    create_table :student_group_courses do |t|
      t.integer :student_group_id
      t.integer :course_id

      t.timestamps
    end
  end
end

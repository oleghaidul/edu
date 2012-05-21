class CreateStudentGroups < ActiveRecord::Migration
  def change
    create_table :student_groups do |t|
      t.string :name
      t.string :group_type
      t.integer :teacher_id

      t.timestamps
    end
  end
end

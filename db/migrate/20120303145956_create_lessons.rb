class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.text :content
      t.text :description
      t.integer :course_id

      t.timestamps
    end
  end
end

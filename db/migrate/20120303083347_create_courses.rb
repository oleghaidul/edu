class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :content
      t.text :description
      t.integer :total_time

      t.timestamps
    end
  end
end

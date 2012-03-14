class CreateUserQuestions < ActiveRecord::Migration
  def change
    create_table :user_questions do |t|
      t.integer :user_id
      t.integer :question_id
      t.boolean :correct
      t.integer :answer_id

      t.timestamps
    end
  end
end

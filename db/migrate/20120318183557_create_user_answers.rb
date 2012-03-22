class CreateUserAnswers < ActiveRecord::Migration
  def change
    create_table :user_answers do |t|
      t.integer :user_id
      t.integer :answer_id
      t.integer :question_id
      t.integer :testing_id

      t.timestamps
    end
  end
end

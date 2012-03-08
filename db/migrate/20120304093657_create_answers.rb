class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :name
      t.integer :question_id
      t.text :body

      t.timestamps
    end
  end
end

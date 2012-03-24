class AddTestingIdToUserQuestions < ActiveRecord::Migration
  def change
    add_column :user_questions, :testing_id, :integer

  end
end

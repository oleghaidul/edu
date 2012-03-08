class AddTestingIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :testing_id, :integer

  end
end

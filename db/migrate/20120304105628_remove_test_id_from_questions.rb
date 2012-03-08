class RemoveTestIdFromQuestions < ActiveRecord::Migration
  def up
    remove_column :questions, :test_id
      end

  def down
    add_column :questions, :test_id, :string
  end
end

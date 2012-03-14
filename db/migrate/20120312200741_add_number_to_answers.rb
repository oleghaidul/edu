class AddNumberToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :number, :integer

  end
end

class CreateUserTestings < ActiveRecord::Migration
  def change
    create_table :user_testings do |t|
      t.integer :user_id
      t.integer :testing_id
      t.boolean :passed

      t.timestamps
    end
  end
end

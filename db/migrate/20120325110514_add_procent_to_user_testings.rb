class AddProcentToUserTestings < ActiveRecord::Migration
  def change
    add_column :user_testings, :procent, :integer

  end
end

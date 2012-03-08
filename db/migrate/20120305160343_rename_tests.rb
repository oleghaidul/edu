class RenameTests < ActiveRecord::Migration
  def up
  	rename_table :tests, :testings
  end

  def down
  	rename_table :testings, :tests
  end
end

class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.string :url
      t.integer :lesson_id

      t.timestamps
    end
  end
end

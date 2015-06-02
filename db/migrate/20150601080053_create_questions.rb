class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :body
      t.integer :answer_id
      t.integer :chapter_id

      t.timestamps null: false
    end
  end
end

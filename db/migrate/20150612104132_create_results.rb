class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :question_id
      t.boolean :correct

      t.timestamps null: false
    end
  end
end

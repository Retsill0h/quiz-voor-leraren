class AddAnswerIdToResult < ActiveRecord::Migration
  def change
    add_column :results, :answer_id, :integer
  end
end

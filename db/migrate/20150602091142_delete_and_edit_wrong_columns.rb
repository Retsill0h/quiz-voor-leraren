class DeleteAndEditWrongColumns < ActiveRecord::Migration
  def change
  	remove_column :users, :user_name
  	remove_column :given_answers, :question_id
  	rename_column :questions, :answer_id, :right_answer_id
  	change_column :users, :student_number, :integer
  end
end

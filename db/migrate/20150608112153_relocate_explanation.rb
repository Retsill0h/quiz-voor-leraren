class RelocateExplanation < ActiveRecord::Migration
  def change
	remove_column :Answers, :explanation
  	add_column :Questions, :explanation, :text
  end
end

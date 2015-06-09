class Question < ActiveRecord::Base
	belongs_to :chapter
	has_many :answers
	accepts_nested_attributes_for :answers

	after_create :set_right_answer

	def set_right_answer
		self.right_answer_id = self.answers.first.id
		self.save
	end
end

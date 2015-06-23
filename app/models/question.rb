class Question < ActiveRecord::Base
	belongs_to :chapter
	has_many :answers, :dependent => :destroy
	has_many :results
	accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:body].blank? }, :allow_destroy => true

	after_create :set_right_answer

	def set_right_answer
		self.right_answer_id = self.answers.first.id
		self.save
	end
	validates :body, :explanation, presence: true
end
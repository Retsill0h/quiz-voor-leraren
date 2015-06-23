class QuestionsController < ApplicationController

	def index
		@question = Question.all
	end

	def show
		if params[:answer_id].present?
			@question = Question.find(params[:id])
			@answer = Answer.find(@question.right_answer_id)
			@given_answer = Answer.find(params[:answer_id])
		else
			@question = Question.order('RANDOM()').first
		end
	end

end
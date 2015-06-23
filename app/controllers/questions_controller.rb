class QuestionsController < ApplicationController
	before_action :set_question, only: [:submit_answer]

	def index
		@question = Question.all
	end

	def show
		session[:answered_questions] = [] if session[:answered_questions].nil?

		if params[:question_id]
			session[:answered_questions] << params[:question_id].to_i
		end
		@answered = session[:answered_questions]

		@question = Question.where.not(id: session[:answered_questions]).order('RANDOM()').first
		if session[:answered_questions].length >= 4
			redirect_to results_path
		end		
	end

	def submit_answer
		answer = Answer.find(params[:answer_id])
		if answer.id == @question.right_answer_id
			Result.create(correct: true, question_id: @question.id, answer_id: answer.id)
			redirect_to results_path
		else
			Result.create(correct: false, question_id: @question.id)
			redirect_to results_path
		end
	end

	private
		def set_question
			@question = Question.find(params[:id])
		end
end
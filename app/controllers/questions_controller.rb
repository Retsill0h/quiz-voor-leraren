class QuestionsController < ApplicationController
	def index
		session[:answered_questions] = [] if session[:answered_questions].nil?

		if params[:question_id]
			session[:answered_questions] << params[:question_id].to_i
		end
		@answered = session[:answered_questions]

		@question = Question.where.not(id: session[:answered_questions]).order('RANDOM()').first
		if session[:answered_questions].length >= 2
			redirect_to results_path
		end
	end

	def show
		
	end

	def submit_answer
		@result = Result.new
		@result.question = @question
		if @answer.id == @question.right_answer_id
			@result.correct = true
			@result.save
		else
			@result.correct = false
			@result.save
		end
	end
end
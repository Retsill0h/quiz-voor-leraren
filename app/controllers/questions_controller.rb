class QuestionsController < ApplicationController
	def index
		session[:answered_questions] = [] if session[:answered_questions].nil?

		if params[:question_id]
			session[:answered_questions] << params[:question_id].to_i
		end
		@answered = session[:answered_questions]

		@question = Question.where.not(id: session[:answered_questions]).order('RANDOM()').first
		if session[:answered_questions].length == 2
			redirect_to admin_chapters_path
		end
	end
end
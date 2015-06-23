class QuestionsController < ApplicationController

	def index
		@question = Question.all
	end

	def show
		if(params.has_key?(:answer_id))

			@question = Question.find(params[:id])
			if params[:answer_id] == @question.right_answer_id
				flash[:error] = "Je hebt het goed beantwoord !"
			end
		else

			@question = Question.order('RANDOM()').first
		end
	end

end
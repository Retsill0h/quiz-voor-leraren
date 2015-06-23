class ResultsController < ApplicationController
	def index
		@result = Result.all
	end

	def show
		@result = Question.find(params[:id])
	end
end

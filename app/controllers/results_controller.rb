class ResultsController < ApplicationController
	def index
		@answer = Answer.all
	end
end

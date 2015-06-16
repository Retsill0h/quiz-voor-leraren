class ResultsController < ApplicationController
	def index
		result = Result.all
	end
end

class Admin::QuestionsController < ApplicationController
	def index
		@question = Question.all
	end
	def new
		@question = Question.new
		@chapter = Chapter.all
	end
end

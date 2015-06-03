class Admin::QuestionsController < ApplicationController
	def index
		@question = Question.all
		@question.build_answer
	end
	def new
		@question = Question.new
		@chapter = Chapter.all
	end
	def create

	end
end

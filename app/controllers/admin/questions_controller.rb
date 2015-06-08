class Admin::QuestionsController < ApplicationController
	def index
		@question = Question.all
		@question.build()
	end
	def new
		@question = Question.new
		@chapter = Chapter.all
		4.times { @question.answers.build }
	end
	def edit
		@question = Question.find(params[:id])
	end
	def create
		@question = Question.new(question_params)

		if @question.save
			redirect_to admin_questions_path
		else
			render 'new'
		end
	end
	def update
		@question = Question.find(params[:id])
		if @question.update(question_params)
			redirect_to admin_question_path
		else
			render 'new'
		end
	end
	def show
		@question = Question.find(params[:id])
		@answer = Answer.all
	end 
	def destroy
		@question = Question.find(params[:id])
		@question.destroy

		redirect_to admin_questions_path
	end
	private
		def question_params
			params.require(:question).permit( :body, :chapter_id, :explanation, answers_attributes: [:id, :body])
		end
end

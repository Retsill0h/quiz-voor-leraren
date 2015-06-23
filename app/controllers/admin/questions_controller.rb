class Admin::QuestionsController < ApplicationController
	layout 'admin'
  protect_from_forgery with: :exception
  	before_filter :authenticate
	protected
		def authenticate
		authenticate_or_request_with_http_basic do |username, password|
		username == "user" && password == "user"
		end
	end
	def index
		@question = Question.order("id desc")
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
			flash[:notice] = "Uw vraag is succesvol opgeslagen !"
			redirect_to admin_questions_path
		else
			render 'new'
		end
	end
	def update
		@question = Question.find(params[:id])
		if @question.update(question_params)
			flash[:notice] = "De vraag is succesvol gewijzigd !"
			redirect_to admin_questions_path
		else
			4.times { @question.answers.build }
			render 'new'
		end
	end
	def show
		@question = Question.find(params[:id])
		@answer = Answer.all
	end 
	def destroy
		@question = Question.find(params[:id])
		if @question.destroy

			flash[:notice] = "De vraag is succesvol verwijderd"
			@question.destroy
		else

			flash[:notice] = "Er is iets verkeerds gegaan"
		end
		redirect_to admin_questions_path
	end
	private
		def question_params
			params.require(:question).permit( :body, :chapter_id, :explanation, answers_attributes: [:id, :body])
		end
end

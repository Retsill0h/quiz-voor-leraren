class Admin::ChaptersController < ApplicationController
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
		@chapter = Chapter.all
	end

	def new
		@chapter = Chapter.new
	end

	def create
		chapter = Chapter.new(chapter_params)

		flash[:notice] = "Het hoofdstuk is succesvol toegevoegd !"
		chapter.save
		redirect_to admin_chapters_path
	end
	def edit
		@chapter = Chapter.find(params[:id])
	end
	def update
		@chapter = Chapter.find(params[:id])
		@chapter.update(chapter_params)
		redirect_to admin_chapters_path
	end
	def destroy
		flash[:notice] = "Het hoofdstuk is succesvol verwijderd !"
		@chapter = Chapter.find(params[:id])
		@chapter.destroy
		redirect_to admin_chapters_path
	end
	private
		def chapter_params
			params.require(:chapter).permit(:body)
		end
end

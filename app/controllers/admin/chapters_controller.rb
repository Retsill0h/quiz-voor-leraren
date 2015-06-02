class Admin::ChaptersController < ApplicationController
	def index
		@chapter = Chapter.all
	end
	def new
		@chapter = Chapter.new
	end
	def edit
		@chapter = Chapter.find(params[:id])
	end
end

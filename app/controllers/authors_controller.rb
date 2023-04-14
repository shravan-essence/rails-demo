require_dependency 'weather_service'
class AuthorsController < ApplicationController
	def index
		@authors = Author.all
	end

	def show
		@author = Author.find(params[:id])
		weather_service =  WeatherService.new(@author.city)
    @weather_data = weather_service.call
	end

	def new
		@author = Author.new
	end

	def create
		@author = Author.new(author_params())
		if @author.save
			redirect_to @author
		else
			render :new, status: 404
		end
	end

	def destroy
		@author = Author.find(params[:id])
		@author.destroy
		redirect_to @author
	end

	private
	def author_params
		params.require(:author).permit(:name, :city, :avatar)
	end
end

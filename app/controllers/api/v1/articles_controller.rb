class Api::V1::ArticlesController < ApplicationController
	skip_before_action :verify_authenticity_token
	
	def index
		@articles = Article.all
		render json: @articles
	end

	# def show
	# 	begin
	# 		@article = Article.find(params[:id])
	# 		render json: @article
	# 	rescue
	# 		render json: "error", status: 404
	# 	end
	# end

	def show
		article = Article.find_by(id: params[:id])
		if article.present?
			render json: article
		else
			render json: { message: 'Record not Found..', status: 404 }
		end
	end

	def create
		article = Article.new(article_params)
		if article.save
			render json: {Record: article, message: "Record created.." }
		else
			render json: { message: "Record not created.." }
		end
	end

	def update
		article = Article.find_by(id: params[:id])
		if article.update(article_params)
			render json: {message: "Record has been updated!!"}
		else
			render json: {message: "Record is not updated"}
		end
	end

	def destroy
		article = Article.find_by(id: params[:id])
		if article
			article.destroy
			render json: {message: "Record has been deleted successfully"}
		else
			render json: { message: "Record is not found"}
		end
	end

	private
	def article_params
		params.permit(:title, :body, :published, :id)
	end
end

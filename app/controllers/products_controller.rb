require_relative '../models/query_objects/products_query'

class ProductsController < ApplicationController
	def index
		query = ProductsQuery.new(Product.all)
    query = query.with_price_range
    #query = query.greater_than
    #query = query.order_by_name
    @products = query
		#@products = Product.includes(:image_attachment => [:blob]).all
	end

	def new
		@product = Product.new
	end

	def show
		@product = Product.find(params[:id])
	end

	def create
		@product = Product.create(product_params)
		if @product.save
			redirect_to @product
		else
			render :new, status: :unprocessable_entity
		end
	end

	def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
  	@product = Product.find(params[:id])
  	@product.destroy
  	redirect_to products_path
  end

	private

	def product_params
		params.require(:product).permit(:name, :description, :price, :image)
	end

	def product_detail
		Product.find(params[:id])
	end
end
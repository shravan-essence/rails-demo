class CheckoutsController < ApplicationController
	skip_forgery_protection
	
	def create
		@product = product_detail
		@image = url_for(@product.image)
		@session = StripeBillingService.new(product_detail, current_student, @image).call
		redirect_to @session.url, allow_other_host: true
	end

	private

	def current_user
		current_student
	end

	def product_detail
    Product.find(params[:product_id])
  end
end
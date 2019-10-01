class ProductsController < ApplicationController
	def index
		@products = Product.where(buy_capable: true)
	end

	def show
		@product = Product.find(params[:id])
		@cart = CartProduct.new
	end
end

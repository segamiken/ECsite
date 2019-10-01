class CartProductsController < ApplicationController

	def index
		@products = current_customer.cart_products.all
	end

	def create
		@product = Product.find(params[:product_id])
		@cart = CartProduct.new(cart_params)
		@cart.customer_id = current_customer.id
		@cart.product_id = @product.id
		if @cart.save!
			redirect_to customer_path(current_customer.id)
		else
			render :new
		end
	end

	def update
		@cart = CartProduct.find(params[:id])
		if @cart.update(cart_params)
			redirect_to cart_products_path
		else
			render :index
		end
	end

	def destroy
		@cart = CartProduct.find(params[:id])
		@cart.destroy
		redirect_to cart_products_path
	end

	private
	def cart_params
		params.require(:cart_product).permit(:quantity)
	end
end

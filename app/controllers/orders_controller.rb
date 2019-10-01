class OrdersController < ApplicationController
	def new
		@order = Order.new
		@cart_products = current_customer.cart_products.all
	end

	def create
		order = current_customer.orders.new(order_params)
		cart_products = current_customer.cart_products.all

		cart_products.each do |c|
			order_product = order.order_products.build
			order_product.cd_title = c.product.cd_title
			order_product.label_name = c.product.label_name
			order_product.product_image_id = c.product.product_image_id
			order_product.price = c.product.price
			order_product.purchase_number = c.quantity
			order_product.subtotal = c.product.price * 1.1 * c.quantity
		end

		if order.save!
			cart_products.each do |c|
				c.product.stock -= c.quantity
				c.product.save
				c.destroy
			end
			redirect_to customer_path(current_customer.id)
		else
			render :new
		end
	end

	private
	def order_params
		params.require(:order).permit(:to_address, :payment_method, order_products_attributes: [:id, :cd_title, :label_name, :product_image, :price, :_destroy])
	end
end

class Admin::ProductsController < ApplicationController
	def new
		@product = Product.new
		@disc = @product.product_discs.build
		@singer = @disc.disc_singers.build
		@song = @dics.disc_songs.build
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to '/'
		else
			render :new
		end
	end

	def edit
	end

	def udpate
	end

	def destroy
	end

	private
	def product_params
		params.require(:product).permit(:genre_id, :cd_title, :label_name, :product_iamge, :price, :stock)
	end
end

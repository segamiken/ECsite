class Admin::ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def new
		@product = Product.new
		@disc = @product.product_discs.build
		@singer = @disc.disc_singers.build
		@song = @disc.disc_songs.build
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
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			redirect_to '/'
		else
			render :edit
		end
	end

	def destroy
	end

	private
	def product_params
		params.require(:product).permit(:genre_id, :cd_title, :label_name, :product_image, :price, :stock, product_discs_attributes: [:id, :disc_title, :destroy, disc_songs_attributes: [:id, :song_name, :_destroy], disc_singers_attributes: [:id, :singer_name, :_destroy]])
	end
end
class Admin::ProductsController < ApplicationController
	def index
		@products = Product.where(buy_capable: true)
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
			arrival = Arrival.new
			arrival.cd_title = @product.cd_title
			arrival.stock = @product.stock
			arrival.price = @product.price
			arrival.save
			redirect_to admin_products_path
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
			redirect_to admin_products_path
		else
			render :edit
		end
	end

	def show
		@product = Product.find(params[:id])
	end

	def destroy
	end

	def arrival
		@arrivals = Arrival.all
	end

	private
	def product_params
		params.require(:product).permit(:genre_id, :cd_title, :label_name, :product_image, :price, :stock, :buy_capable, product_discs_attributes: [:id, :disc_title, :destroy, disc_songs_attributes: [:id, :song_name, :_destroy], disc_singers_attributes: [:id, :singer_name, :_destroy]])
	end
end

class Admin::GenresController < ApplicationController
	def new
		@genre = Genre.new
	end

	def create
		@genre = Genre.new(genre_params)
		if @genre.save
			redirect_to '/'
		else
			render :new
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	def genre_params
		params.require(:genre).permit(:genre_name)
	end
end

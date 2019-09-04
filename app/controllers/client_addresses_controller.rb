class ClientAddressesController < ApplicationController
	def new
		@address = ClientAddress.new
	end

	def create
		@address = ClientAddress.new(address_params)
		@address.customer_id = current_customer.id
		if @address.save
			redirect_to "/"
		else
			render :new
		end
	end

	def edit
		@address = ClientAddress.find(params[:id])
	end

	def update
		@address = ClientAddress.find(params[:id])
		if @address.update(address_params)
			redirect_to customer_path(current_customer.id)
		else
			render :edit
		end
	end

	def destroy
		
	end

	private
	def address_params
		params.require(:client_address).permit(:postal_code, :address, :name, :name_kana)
	end
end

class Product < ApplicationRecord
	belongs_to :genre
	has_many :product_discs
	has_many :cart_products
	has_many :favorites
	has_many :reviews
end

class Product < ApplicationRecord

	attachment :product_image
	belongs_to :genre

	has_many :product_discs
	accepts_nested_attributes_for :product_discs, allow_destroy: true

	has_many :cart_products
	has_many :favorites
	has_many :reviews
end

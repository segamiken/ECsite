class Order < ApplicationRecord
	belongs_to :customer
	has_many :order_products
	accepts_nested_attributes_for :order_products, allow_destroy: true

	enum payment_method:{クレジットカード: 0, 銀行振込: 1, コンビニ決済: 2}
end

class ProductDisc < ApplicationRecord
	belongs_to :product
	has_many :disc_songs
	has_many :disc_singers
end

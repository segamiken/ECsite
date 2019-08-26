class ProductDisc < ApplicationRecord
	belongs_to :product
	has_many :disc_songs
	has_many :disc_singers

	accepts_nested_attributes_for :disc_songs, allow_destroy: true
	accepts_nested_attributes_for :disc_singers, allow_destroy: true
end

class Item < ActiveRecord::Base
	belongs_to :product
	belongs_to :wishlist
end
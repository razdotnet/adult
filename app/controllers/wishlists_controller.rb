
class WishlistsController < ApplicationController
	def show
		user = User.find(params[:user_id])
		@wishlist = user.wishlist
		@products = Product.all
	end

	def create
		user = current_user
		@wishlist = user.create_wishlist

		if @wishlist.save
			redirect_to root_url, notice: 'lol'
		end
	end
end
class ItemsController < ApplicationController
	def create
		wishlist = Wishlist.find(params[:wishlist])
		product = Product.find(params[:product])

		@item = Item.create(product: product, wishlist: wishlist)

		if @item.save
		redirect_to root_url		
		end
	end
end
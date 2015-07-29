class Housekeeping::DashboardController < HousekeepingsController

	def show
		@products = Product.limit(5)
		@users = User.all
		@wishlists = Wishlist.all
		@categories = Category.all
		@orders = Order.all
	end
end

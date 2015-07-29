class OrdersController < ApplicationController
	def show
		@store = Store.find(params[:store_id])
		@order = Order.find(params[:id])
		
		if @store.user == current_user || @order.user == current_user
			@order = Order.find(params[:id])
		else
			redirect_to root_url
		end
	end

	def index
		@orders = Order.where(user_id: current_user.id)
	end

	def new
		@order = Order.new
		@store = Store.find(params[:store_id])
		@product = Product.find(params[:product_id])
	end

	def create
		@product = Product.find(params[:product_id])
		@store = Store.find(params[:store_id])
		user = User.find(params[:user_id])
		@order = Order.new order_params

		if @order.save
			redirect_to store_product_order_path(@order.user, @store, @product, @order), notice: 'Created order'
		else
			render('new')
		end
	end

	private

		def order_params
			params.require(:order).permit(:product_id, :user_id, :store_id)
		end
end

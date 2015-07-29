class ChargesController < ApplicationController
	

	def new
	end

	def create
		@order = Order.find(params[:order_id])
		@user = current_user

		customer = Stripe::Customer.create(
			:email => @user.email,
			:card => params[:stripeToken]
		)

		charge = Stripe::Charge.create(
			:customer => customer.id,
			:amount => params[:amount],
			:description => 'Order created',
			:currency => 'usd'
		)

		@order.update_attributes(paid: true)

	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to root_url
	end

	private

		def find_order
			@order = Order.find_by_id(params[:id])
		end
end
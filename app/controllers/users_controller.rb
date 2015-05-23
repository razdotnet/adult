class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@friends = @user.friendables
	end

	def friend_request
		user_id = current_user.id
		friend_id = params[:user_id]
		friendable = Friendable.create(user_id: user_id, friend_id: friend_id, accepted: false)
		redirect_to root_url, notice: 'Sent friend request.'
	end

	def friend_request_accept
		friendable = Friendable.where(user_id: current_user.id).first
		friendable.update_attributes(accepted: true)
		redirect_to root_url, notice: 'accepted friend request'
	end
end
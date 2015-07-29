class FriendablesController < ApplicationController
	def create
		user = current_user.id
		friend = params[:user_id]
		friendable = Friendable.request(user, friend)
		redirect_to root_url, notice: 'Sent friend request.' 
	end
end
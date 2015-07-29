class DashboardsController < ApplicationController
	def show
		@user = current_user
		@friends_count = Friendable.where(user_id: current_user.id).count
		@conversations = Conversation.my_convos(@user).count
		@pictures = Picture.all
	end
end
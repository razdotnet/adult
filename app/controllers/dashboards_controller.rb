class DashboardsController < ApplicationController
	def show
		@user = current_user
		@friend_requests = Friendable.pending.where.not(user_id: current_user.id)
		@friends = Friendable.where(user_id: current_user.id).accepted
	end
end
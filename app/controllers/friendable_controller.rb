class FriendableController < ApplicationController
	def friend_request
		from_id = current_user.id
		to_id = params[:id]
		friendable = Friendable.create(from_id: from_id, to_id: to_id, accepted: false)
	end
end
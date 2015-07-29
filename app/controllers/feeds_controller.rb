class FeedsController < ApplicationController
	def show
		@user = current_user
		@posts = Post.recent(current_user)
	end
end
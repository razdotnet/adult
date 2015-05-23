module ApplicationHelper
	def profile(user)
		user.id == current_user.id
	end
end
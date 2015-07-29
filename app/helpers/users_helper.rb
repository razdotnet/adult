module UsersHelper
	def already_friends?(user)
		@user.friends.include? user
	end

	def model?(user)
	user.model
end

def store?(user)
	user.store
end
end

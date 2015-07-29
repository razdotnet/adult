class Friendable < ActiveRecord::Base
	belongs_to :user
	belongs_to :friend, class_name: "User"

	scope :pending, -> {where(accepted: false)}
	scope :accepted, -> {where(accepted: true)}

	def self.request(user, friend)
		transaction do
			create(user_id: user, friend_id: friend)
			create(user_id: friend, friend_id: user)
		end
	end

end
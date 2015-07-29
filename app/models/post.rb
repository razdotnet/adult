class Post < ActiveRecord::Base
	belongs_to :user

	scope :recent, -> {order(id: :asc)}

	def self.recent(user)
		Post.where(user_id: user.friends).order(created_at: :desc)
	end
end
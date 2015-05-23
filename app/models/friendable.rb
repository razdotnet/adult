class Friendable < ActiveRecord::Base
	belongs_to :user
	belongs_to :friend, class_name: "User"

	scope :pending, -> {where(accepted: false)}
	scope :accepted, -> {where(accepted: true)}
end
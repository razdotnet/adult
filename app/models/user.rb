class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
				:recoverable, :rememberable, :trackable, :validatable

	has_one :wishlist
	has_one :location
	has_many :pictures
	has_many :orders
	has_many :posts
	has_many :friendables
	has_many :friends, through: :friendables
	has_many :comments, class_name: 'PhotoComment'
	has_attached_file :avatar, style: {medium: "200x200", thumb: "100x100"}
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	def self.local
		where(local: 1)
	end

	def self.random
		where(local: 0)
	end

	enum local: [:no, :yes]
end

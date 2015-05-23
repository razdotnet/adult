class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
				:recoverable, :rememberable, :trackable, :validatable

	has_one :location

	has_many :friendables
	has_many :friends, through: :friendables

	def current? user
		friends.include? user.id
	end

	def self.local
		where(local: 1)
	end

	def self.random
		where(local: 0)
	end

	enum local: [:no, :yes]
end

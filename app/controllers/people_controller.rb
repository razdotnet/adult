class PeopleController < ApplicationController
	def index
		@local = User.local
		@random = User.random
		@users = User.all
	end
end

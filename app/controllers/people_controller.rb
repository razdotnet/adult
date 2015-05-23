class PeopleController < ApplicationController
	def index
		@local = User.local
		@random = User.random
	end
end

class ExploresController < ApplicationController
	def show
		@local = User.local
		@users = User.all
		@random = User.random
	end
end
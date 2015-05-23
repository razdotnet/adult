class ExploresController < ApplicationController
	def show
		@local = User.local
		@random = User.random
	end
end
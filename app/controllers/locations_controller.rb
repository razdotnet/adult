class LocationsController < ApplicationController
	def new
		
	end

	def edit
		@user = User.find(current_user.id)
		@location = @user.location
	end

	def update
		@location = current_user.location

		if @location.update(location_params)
			redirect_to root_url
		else
			render "edit"
		end
	end

	private

		def location_params
			params.require(:location).permit(:postcode)
		end
end
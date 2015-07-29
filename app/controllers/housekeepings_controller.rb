class HousekeepingsController < ApplicationController
	before_filter :ensure_admin!

	private

		def ensure_admin!
			if user_signed_in?
				unless current_user.admin?
					redirect_to root_url, notice: 'nosir!'
				end
			end
		end
end

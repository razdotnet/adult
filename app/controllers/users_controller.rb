class UsersController < ApplicationController
	def show
		@user = User.find(params[:user_id])
		@posts = @user.posts
		@friends = Friendable.where(friend_id: current_user)
	end

	def edit
		@user = current_user
		@location = current_user.location

		if params[:email]
			render 'email'
		end
	end

	def update
		@user = User.find(current_user.id)

		if @user.update(user_params)
			sign_in @user, :bypass => true
			redirect_to root_url
		else
			render "edit"
		end
	end

	private

		def user_params
			params.require(:user).permit(:email, :postcode, :username, :model, :avatar)
		end
end
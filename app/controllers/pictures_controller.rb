class PicturesController < ApplicationController
	before_action do
		@user = User.find(params[:user_id])
	end
	
	def index
		user = User.find(params[:user_id])
		@pictures = user.pictures
	end

	def new
		@picture = Picture.new
		user = User.find(params[:user_id])
	end

	def create
		user = current_user
		@picture = user.pictures.build picture_params

		if @picture.save
		 	redirect_to picture_all_path, notice: 'uploaded picture, thank you.'
		 else
		 	render('new')
		 end 
	end

	def show
		user = User.find(params[:user_id])
		@picture = Picture.find(params[:picture_id])
	
		if @picture.user == @user
		else
			redirect_to root_url, notice: 'Failed'
		end
	end

	private

		def picture_params
			params.require(:picture).permit(:title, :attachment)
		end
end
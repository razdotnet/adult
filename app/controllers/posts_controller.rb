class PostsController < ApplicationController
	def index
	end

	def new
		@post = Post.new
	end

	def create
		user = current_user
		@post = user.posts.build post_params

		if @post.save
			redirect_to root_url, notice: 'Created post'
		else
			render('new')
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	private

		def post_params
			params.require(:post).permit(:body)
		end
end
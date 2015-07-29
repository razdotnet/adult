class Housekeeping::CategoriesController < ApplicationController
	def show
		@category = Category.find(params[:id])
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new category_params

		if @category.save
			redirect_to housekeeping_category_path(@category), notice: 'created category'
		else
			render('new')
		end
	end

	private

		def category_params
			params.require(:category).permit(:title)
		end
end
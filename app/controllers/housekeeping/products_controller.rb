class Housekeeping::ProductsController < ApplicationController
	def new
		@product = Product.new

	end

	def index
		@products = Product.all
	end

	def create
		@category = Category.find(params[:cateogry][:category_id])
		@product = Product.new product_params

		@main = @category.product_categories.create(product: @product)

		if @main.save
			redirect_to housekeeping_products_path, notice: 'Created product'
		else
			render('new')
		end
	end

	private

		def product_params
			params.require(:product).permit(:title, :desc)
		end
end
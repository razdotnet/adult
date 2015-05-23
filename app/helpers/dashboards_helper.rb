module DashboardsHelper
	def my_requests? user
		friends.include? user.id 
	end
end
class HomeController < ApplicationController
	def index
	end

	def contact_us
	end


	def about_us
		emails = ["arvind171@ymail.com", "bharatlaksh123@gmail.com", "laxkardk@gmail.com", "prakashlaxkar@gmail.com"]
		@users = User.where(:email => emails).reorder("name desc")
	end

	def about_samaj
	end

	def donate_now
	end
	
	def about_bhajneri	
	end
end

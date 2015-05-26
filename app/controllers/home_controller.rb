class HomeController < ApplicationController
	def index
	end

	def contact_us
		@user_message = UserMessage.new
	end

	def create_message
		@user_message = UserMessage.new(params[:user_message].permit!)
	    respond_to do |format|
	      if @user_message.save
	        format.html { redirect_to root_path, notice: 'Your message was successfully created.' }
	      else
	        format.html { render action: 'contact_us' }
	        format.json { render json: @user_message.errors, status: :unprocessable_entity }
	      end
	    end
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

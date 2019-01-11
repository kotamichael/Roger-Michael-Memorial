class StaticPagesController < ApplicationController
	def home
		if logged_in?
			@micropost  = current_user.microposts.build
			@food = current_user.foods.build
			@feed_items = current_user.feed.paginate(page: params[:page])
			@gift_items = current_user.food_feed.paginate(page: params[:page])
		end
	end

	def share
		if logged_in?
			@micropost  = current_user.microposts.build
		else
			flash[:danger] = "You must be signed up and logged in to make posts!"
		end
		@feed_items = Micropost.order(:id).paginate(page: params[:page])
	end

	def information
	end

	def bio
	end

	def giving
		if logged_in?
			@food  = current_user.foods.build
			@micropost  = current_user.microposts.build
		else
			flash[:danger] = "You must be signed up and logged in to post what you're bringing!"
		end
		@gift_items = Food.order(:id).paginate(page: params[:page])
	end
end

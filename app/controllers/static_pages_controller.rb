class StaticPagesController < ApplicationController
	def home
		if logged_in?
			@micropost  = current_user.microposts.build
			@feed_items = current_user.feed.paginate(page: params[:page])
		end
	end

	def share
		if logged_in?
			@micropost  = current_user.microposts.build
		end
		@feed_items = Micropost.order(:id).paginate(page: params[:page])
	end

	def about
	end

	def contact
	end
end

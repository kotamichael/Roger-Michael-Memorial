class FoodsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
	before_action :correct_user,   only: :destroy

	def create
		@food = current_user.foods.build(food_params)
	    if @food.save
	    	flash[:success] = "Thank you for your gift!"
	    	redirect_to giving_url
	    else
	    	@gift_items = []
	    	render 'static_pages/giving'
	    end
	end

	def destroy
		@food.destroy
		flash[:success] = "Your post regarding food donation was deleted"
		redirect_to request.referrer || giving_url
	end

	private

		def food_params
	      	params.require(:food).permit(:content)
	    end

	    def correct_user
	        @food = current_user.foods.find_by(id: params[:id])
	        redirect_to root_url if @food.nil?
	    end
end

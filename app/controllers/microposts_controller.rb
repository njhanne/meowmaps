class MicropostsController < ApplicationController
	before_action :signed_in_user

	def create
		@micropost = current_user.microposts.build(micropost_params)
		if @micropost.save
			flash[:success] = "Comment posted!"
			redirect_to root_url
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end

	def destroy
		@micropost.destroy
		redirect_to root_url
	end

	private

		def micropost_params
			params.require(:micropost).permit(:content)
		end

		def correct_user
			@micropost = correct_user.micropost.find_by(id: params[:id])
			redirect_to root_url if @micropost.nil?
		end

end
class UsersController < ApplicationController
	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_path
		else
			flash[:alert] = "Bad email or password"
			render "sessions/new"
		end
	end

	def show
		@user = current_user
	end

	def new
		@user = User.new
	end

	def search
		@user = current_user
		@users = User.filter(params.slice(:search_name))
		render "welcome/index"
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end
end

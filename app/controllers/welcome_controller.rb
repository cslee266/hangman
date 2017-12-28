class WelcomeController < ApplicationController
  include UsersHelper

  def index
  	if logged_in?
		@user = User.find_by(id: session[:user_id])
	else
		@user = User.new
		render "sessions/new"
	end

	if !@user.room.nil?
		@room = @user.room
	end
  end
end

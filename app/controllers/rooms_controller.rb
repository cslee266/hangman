class RoomsController < ApplicationController
  def create
  	@room = Room.new(owner_id: current_user.id)
    current_user.role = 1
  	if @room.save && current_user.save(validate: false)
  		redirect_to room_path(@room.id)
  	else
  		redirect_to root_path
  	end
  end

  def update
  	current_user.room.update(visitor_id: params[:friend_id])
    @room = current_user.room
    visitor = User.find(params[:friend_id])
    respond_to do |format|
      format.json { render json: visitor }
    end
  end

  def show
    @room = current_user.room
    @game = Game.new
  end

  def destroy
  	@room = current_user.room.destroy
    current_user.role = 0
    current_user.save
    redirect_to root_path
  end
end

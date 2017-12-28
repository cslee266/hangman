class RelationshipsController < ApplicationController
  def create
  	current_user.relationships.create(friend_id: params[:user_id])
  	redirect_to root_path
  end


  def destroy
  	@relationship = current_user.relationships.find_by(friend_id: params[:user_id])
  	@relationship.destroy
  	redirect_to root_path
  end
end

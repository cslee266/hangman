class GamesController < ApplicationController
	def create
		@game = Game.new(owner_id: params["game"]["owner_id"])
		@game.visitor_id = params["game"]["visitor_id"]
		@game.domain = params["category"]
		@game.word = Game.get_words(params["category"]).sample
		if @game.save
			@wrong = Array.new
			@room = current_user.room
			render "rooms/show"
		else
			redirect_to root_path
		end
	end

	def input
		@game = Game.find(params[:game_id])
		@mistake = params[:mistake].to_i
		@wrong = params[:wrong]
		if @game.word.scan(params[:input]).any?
			@word = Game.replace(params[:word], @game.word, params[:input])
		else
			@wrong << params[:input].upcase
			@word = params[:word]
			@mistake += 1
		end
		@room = current_user.room
		render "rooms/show"
	end

	private

	def game_params
		params.require(:game).permit(:owner_id, :visitor_id, :domain, :word)
	end
end

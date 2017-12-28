require 'rails_helper'

RSpec.describe Game, type: :model do
	describe "Game.check_for_special_char(word)" do
		context "When word has a dash" do
			it "should return a nested array with the index and character" do
				word = "t-shirt"
				result = Game.check_for_special_char(word)
				expect(result).to eq([nil, nil, [1, "-"], nil])
			end
		end

		context "When word does not have special character" do
			it "should return return false" do
				word = "shirt"
				result = Game.check_for_special_char(word)
				expect(result).to eq(false)
			end
		end
	end

	describe "Game.generate_blanks(selected_word)" do
		context "When word has a space" do
			it "should return blanks with space at the right position" do
				selected_word = "jingle bell"
				result = Game.generate_blanks(selected_word)
				expect(result).to eq(["_", "_", "_", "_", "_", "_", " ", "_", "_", "_", "_"])
			end
		end

		context "When word does not have a space" do
			it "should return blanks" do
				selected_word = "christmas"
				result = Game.generate_blanks(selected_word)
				expect(result).to eq(["_", "_", "_", "_", "_", "_", "_", "_", "_"])
			end
		end
	end
end

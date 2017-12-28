require 'rails_helper'

RSpec.describe User, type: :model do
	describe "Validates email uniqueness" do
		context "When user signs up with a registered email" do
			it "should not sign up the user" do
				user1 = User.create(name: "user1", email: "user1@gmail.com", password: "user1user1")
				user2 = User.new(name: "user2", email: "user1@gmail.com", password: "user2user2")
				expect(user2.save).to eq(false)
			end
		end
	end

	describe "Validates presence of email" do
		context "When email column is left blank" do
			it "should not sign up the user" do
				user1 = User.new(name: "user1", email: "", password: "user1user1")
				expect(user1.save).to eq(false)
			end
		end

		context "When email column is filled up" do
			it "should return true when the Completed button is clicked" do
				user1 = User.new(name: "user1", email: "user1@gmail.com", password: "user1user1")
				expect(user1.save).to eq(true)
			end
		end
	end
end

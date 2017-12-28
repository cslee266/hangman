require 'rails_helper'

RSpec.feature "SignUps", type: :feature do
  feature "User to sign up" do
    scenario "clicks on sign up link" do
      visit root_path
      click_link "Sign Up Here"
      expect(page).to have_selector(:link_or_button, 'Sign Up')
    end
  end
end

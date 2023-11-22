require 'rails_helper'

RSpec.describe "Sessions", type: :system do
  describe "sign_in" do
    it "allows users to sign in" do
      sign_up
      sign_out
      visit "/"
      click_on "user-login"
      fill_in "user-email", with: "jdoe@email.com"
      fill_in "user-password", with: "secret123"
      click_on "user-login-submit"
      expect(page).to have_content("Welcome jdoe@email.com")
    end
  end
end

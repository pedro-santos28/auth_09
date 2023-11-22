require 'rails_helper'
require 'action_mailer'

include EmailSpec::Helpers
include ActiveJob::TestHelper

RSpec.describe "RecoverPasswords", type: :system do
  Capybara.raise_server_errors = false

  before do
    driven_by(:selenium, using: :firefox, screen_size: [1400, 1400])

  end

  describe "recover_password" do

    it "allows users to recover their passwords" do
      visit "/"
      click_on "sign-in"
      click_on "forgot-password"
      fill_in "user-email", with: "pedro@gmail.com"
      click_on "user-submit"

      sent_email = last_email_sent
      open_email("pedro@gmail.com", with_subject: "Password recovery")
      expect(sent_email).to be_present

      visit_in_email("New password")
      expect(page).to have_text("Enter your new password")

      fill_in "user-password", with: "123456"
      fill_in "user-password-confirmation", with: "123456"
      click_on "update-password-submit"

      expect(page).to have_text("Your password has been updated")

      sign_in

      expect(page).to have_text("Welcome pedro@gmail.com")

    end
  end
end

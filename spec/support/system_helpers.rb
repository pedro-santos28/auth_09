module SystemHelpers
  include EmailSpec::Helpers
  include EmailSpec::Matchers
  include ActiveJob::TestHelper
  # include Rails.application.routes.url_helpers

  def sign_up
    visit "/"
    click_on "sign-up"
    fill_in "user-email", with: "pedro@gmail.com"
    fill_in "user-password", with: "654321"
    click_on "user-sign-up-submit"
  end

  def sign_in
    visit "/"
      click_on "sign-in"
      fill_in "user-email", with: "pedro@gmail.com"
      fill_in "user-password", with: "654321"
      click_on "user-login-submit"
      expect(page).to have_content("Welcome pedro@gmail.com")
  end

  def sign_out
    click_on "user-sign-out"
  end

end

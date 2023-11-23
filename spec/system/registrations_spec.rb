require 'rails_helper'

RSpec.describe "Registrations", type: :system do
  Capybara.raise_server_errors == false

  it "allows users to sign up" do
    visit "/"
    click_on "sign-up"
    fill_in "user-email", with: "pedro@gmail.com"
    fill_in "user-password", with: "654321"
    click_on "user-sign-up-submit"
    expect(page).to have_content("Welcome pedro@gmail.com")
  end
end

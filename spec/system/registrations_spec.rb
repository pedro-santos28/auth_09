require 'rails_helper'

RSpec.describe "Registrations", type: :system do
  it "allows users to sign up" do
    visit "/"
    click_on "sign-up"
    fill_in "user-email", with: "jdoe@email.com"
    fill_in "user-password", with: "secret123"
    click_on "user-submit"
    expect(page).to have_content("Welcome jdoe@email.com")
  end
end

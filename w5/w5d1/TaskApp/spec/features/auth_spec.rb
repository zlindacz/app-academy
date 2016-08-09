# spec/features/auth_spec.rb

require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  before(:each) do
    visit new_user_url
  end

  scenario "has a new user page" do
    expect(page).to have_content("Sign Up")
  end

  feature "signing up a user" do

    before(:each) do
      fill_in 'Username', :with => "testing_username"
      fill_in 'Password', :with => "valid_password"
      click_on "Create User"
    end

    scenario "shows username on the homepage after signup" do
      expect(page).to have_content("Logged in as testing_username")
    end

  end

end

feature "logging in" do

  before(:each) do
    FactoryGirl.create(:user, username: "testing_username", password: "valid_password")
    visit new_session_url
  end

  scenario "shows username on the homepage after login" do

    fill_in 'Username', :with => "testing_username"
    fill_in 'Password', :with => "valid_password"
    click_on "Sign In"
    expect(page).to have_content("Logged in as testing_username")
  end

end

feature "logging out" do

  before(:each) do
    FactoryGirl.create(:user, username: "testing_username", password: "valid_password")
  end

  scenario "begins with a logged out state" do
    visit new_session_url
    expect(page).to_not have_content("Logged in as testing_username")
  end

  scenario "doesn't show username on the homepage after logout" do
    visit new_session_url
    fill_in 'Username', :with => "testing_username"
    fill_in 'Password', :with => "valid_password"
    click_on "Sign In"
    expect(page).to have_content("Logged in as testing_username")

    click_on "Logout"
    expect(page).to_not have_content("Logged in as testing_username")
  end

end

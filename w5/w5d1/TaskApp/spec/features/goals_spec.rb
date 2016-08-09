require 'spec_helper'
require 'rails_helper'

feature "the index page"

feature "has a new goal page" do
  before(:each) do
    sign_up_as_ginger_baker
    visit new_goal_url
  end

  scenario "shows the create goal form on page" do
    expect(page).to have_content 'Create New Goal'
    expect(page).to have_content 'Private'
    expect(page).to have_content 'Public'
    expect(page).to have_content 'Completed'
  end

  scenario "creates a new goal" do
    fill_in 'Title', with: 'Study more'
    fill_in 'Description', with: '2 hours/day'
    choose('Private')
    choose('Not completed')
    click_button 'Create Goal'
    expect(current_path).to eq(goal_path(Goal.last))
  end

end

feature "has a show page" do

  before(:each) do
    FactoryGirl.create(:user)
    FactoryGirl.create(:user)
    FactoryGirl.create(:goal, user_id: User.first.id, privacy: true)
    FactoryGirl.create(:goal, user_id: User.first.id)

    sign_up_as_ginger_baker
    visit new_goal_url
    fill_in 'Title', with: 'Study more'
    fill_in 'Description', with: '2 hours/day'
    choose('Private')
    choose('Not completed')
    click_button 'Create Goal'
  end

  feature "user is logged in" do
    scenario "shows private goal that belongs to user" do
      expect(page).to have_content("Study more")
    end

    scenario "does not show private goals of other users" do
      other_user_private_goal = User.first.goals.first.id
      save_and_open_page
      visit goal_url(other_user_private_goal)
      expect(page).to_not have_content("Title")
    end
  end
end

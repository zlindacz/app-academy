feature "has an index page" do

  scenario "user is redirected to login page if not logged in"
    expect(current_path).to eq(new_session_path)
  end

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

      visit new_goal_url
      fill_in 'Title', with: 'Sleep more'
      fill_in 'Description', with: '30 min hours/day'
      choose('Public')
      choose('Not completed')
      click_button 'Create Goal'
    end

  context "user is logged in" do
    scenario "shows public and private methods" do
      expect(page).to have_content("Study more")
      expect(page).to have_content("Sleep more")
    end
  end

  # context "user is not logged in" do
  #   scenario "cannot view private methods" do
  #
  #   end
  # end

end

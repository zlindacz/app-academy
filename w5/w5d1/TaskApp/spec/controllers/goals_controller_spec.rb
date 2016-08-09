require 'rails_helper'

RSpec.describe GoalsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  before(:each) do
    user = FactoryGirl.create(:user)
    session[:session_token] = user.session_token
    FactoryGirl.create(:goal, user_id: User.last.id)
  end

  describe "GET #show" do
    it "renders show page" do
      get :show, {id: Goal.first.id}
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "renders new page" do
      get :new
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    it "redirects to index" do
      # FactoryGirl.create(:user)
      post :create, { goal: {title: "jgbhsd", description: "kdnkfjhewu", user_id: User.first.id } }
      expect(response).to redirect_to(goal_url(Goal.last.id))
    end
  end


  describe "GET #edit" do
    it "renders edit page" do
      get :edit, { id: Goal.last.id }
      expect(response).to be_success
    end
  end

  describe "PATCH #update" do
    it "redirects to show" do
      # FactoryGirl.create(:user)
      patch :update, { id: Goal.last.id, goal: {title: "edited", description: "also edited", user_id: User.last.id }}
      expect(response).to redirect_to(goal_url(Goal.last.id))
      expect(User.last.goals.last.title).to eq("edited")
    end
  end

  describe "DELETE #destroy" do
    it "redirects to index" do
      FactoryGirl.create(:goal, user_id: User.last.id)
      goal_id = Goal.last.id
      # FactoryGirl.create(:user)
      # FactoryGirl.create(:goal, user_id: User.first.id)
      delete :destroy, { id: Goal.last.id }
      # expect(response).to be_success
      expect(Goal.last.id).to_not eq(goal_id)
    end
  end

end

require 'rails_helper'


RSpec.describe User, type: :model do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should have_many(:subs) }
  it { should have_many(:user_votes) }
  it { should have_many(:comments) }

  describe 'password encryption' do
    #is_password?
    it "validates password belongs to user" do
      linda = User.create!(username: "linda", password: "000000")
      expect(linda.is_password?(password))to be_true
    end

    #reset_session_token!
    it "generates new session token" do
      session_token = SecureRandom.urlsafe_base64(16)
      session[:session_token] = session_token
      expect(reset_session_token).not_to equal(session_token)
    end

    # ::find_by_credentials
    it "finds user using login info from params" do
      linda = User.create!(username: "linda", password: "000000")
      expect(find_by_credentials('linda', '000000').to eq(linda))
    end


  end


end

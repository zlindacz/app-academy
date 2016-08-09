# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  session_token   :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do

  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
  end

  describe "associations" do
    it { should have_many(:goals) }
  end

  describe "validates new users" do
    context "with invalid params" do
      it "invalidates users" do
        expect(FactoryGirl.build(:user, password: "short")).not_to be_valid
      end
    end

    context "with valid params" do
      it "saves creates a valid user" do
        expect(FactoryGirl.build(:user)).to be_valid
      end
    end
  end
end

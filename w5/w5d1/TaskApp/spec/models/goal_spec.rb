# == Schema Information
#
# Table name: goals
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  title       :string           not null
#  description :text             not null
#  privacy     :boolean          default(FALSE), not null
#  completed   :boolean          default(FALSE), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Goal, type: :model do

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:privacy) }
    it { should validate_presence_of(:completed) }
  end

  describe "associations" do
    it { should belong_to(:user) }
    # it { should have_many(:comments) }
  end

  describe "generates a valid goal" do
    context "checks params" do
      it "bad goals" do
        expect(FactoryGirl.build(:goal, title: '')).not_to be_valid
      end
      it "good goals" do
        expect(FactoryGirl.build(:goal)).to be_valid
      end
    end
  end

end

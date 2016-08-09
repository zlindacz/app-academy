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

FactoryGirl.define do
  factory :goal do
    user_id 1
    title { Faker::Company.catch_phrase }
    description { Faker::Hipster.sentence(12) }
    privacy {false}
    completed {false}
  end
end

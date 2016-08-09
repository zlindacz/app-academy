FactoryGirl.define do
  factory :user do # The name matters. :cat factory returns a Cat object.
    username { Faker::Internet.user_name}
    password "password"
  end
end

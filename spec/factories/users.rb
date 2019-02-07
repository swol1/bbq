FactoryBot.define do
  factory :user do
    name { 'Denis' }
    sequence(:email) { |n| "myemail#{n}@gmail.com" }
    admin { false }
    avatar { nil }

    after(:build) { |u| u.password_confirmation = u.password = '123456' }
  end
end
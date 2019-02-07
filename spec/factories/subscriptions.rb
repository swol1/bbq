FactoryBot.define do
  factory :subscription do
    association :user
    association :event

    user_name { nil }
    user_email { nil }
  end
end
FactoryBot.define do
  factory :comment do
    body { 'Хорошее событие' }
    user_name { 'Denis' }

    association :user
    association :event
  end
end
FactoryBot.define do
  factory :event do
    association :user

    title { 'Идем а шашлыки' }
    address { 'Москва, парк' }
    datetime { '2019-10-10 13:00' }
    pincode { '123456' }
  end
end
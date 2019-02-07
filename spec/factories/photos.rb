FactoryBot.define do
  factory :photo do
    association :user
    association :event

    image = File.new(Rails.root + 'spec/factories/images/hilda.jpg')
    photo { image }
  end
end
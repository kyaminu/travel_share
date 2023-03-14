FactoryBot.define do
  factory :trip_users do
    association :user
    association :trip
  end
end

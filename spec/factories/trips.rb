FactoryBot.define do
  factory :trip do
    destination {  }
    sequence(:title, "title_1") 
    start_at { 1.week.from_now }
    association :user
  end
end

FactoryBot.define do
  factory :trip do
    sequence( :title, "title_1" ) 
    destination { rand(0..4) }
    day { rand(1..3) }
    start_at { 1.week.from_now }
  end
end

class Trip < ApplicationRecord
  has_many :trip_users, dependent: :destroy
  has_many :user_trips, through: :trip_users, source: :user
  has_many :trip_contents, dependent: :destroy
  
  enum trip_types: { 大阪: 0, 東京: 1 }
end

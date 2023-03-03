class TripContent < ApplicationRecord
  belongs_to :trip
  
  validates :scheduled_time, presence: true
  validates :schedule, presence: true
end

class TripContent < ApplicationRecord
  belongs_to :trip
  
  validates :timestamp, presence: true
  validates :content, presence: true
end

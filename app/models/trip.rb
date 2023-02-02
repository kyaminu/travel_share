class Trip < ApplicationRecord
  has_many :trip_users, dependent: :destroy
  has_many :user_trips, through: :trip_users, source: :user
  has_many :trip_contents, dependent: :destroy
  
  attr_accessor :day
  
  enum trip_types: { 大阪: 0, 東京: 1 }
  
  def recommended_trips 
    recommended_trips={
        "0"=>[
            {timestamp:'11:00:00',content:'USJに向かう'},
            {timestamp:'13:00:00',content:'たこやき食べる'},
            {timestamp:'15:00:00',content:'通天閣に向かう'}
          ],
        "1"=>[
            {timestamp:'11:00:00',content:'東京タワーに向かう'},
            {timestamp:'13:00:00',content:'メシ食べる'},
            {timestamp:'15:00:00',content:'スカイツリーに向かう'}
          ]
      }
  end
end

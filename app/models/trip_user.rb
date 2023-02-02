class TripUser < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  
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

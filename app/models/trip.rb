class Trip < ApplicationRecord
  has_many :trip_users, dependent: :destroy
  has_many :user_trips, through: :trip_users, source: :user
  has_many :trip_contents, dependent: :destroy

  attr_accessor :day

  enum trip_types: { 大阪: 0, 東京: 1, 北海道: 2, 愛知: 3, 福岡: 4 }

  def recommended_trips
    recommended_trips={
        "0"=>[ #大阪
            {timestamp:'10:00:00',content:'アラビヤコーヒー'},
            {timestamp:'11:00:00',content:'難波八阪神社'},
            {timestamp:'12:30:00',content:'お好み焼き・鉄板焼 ぼんくら家 道頓堀店'},
            {timestamp:'14:00:00',content:'なんばグランド花月'},
            {timestamp:'16:00:00',content:'KAMON HOTEL なんば'}
          ],
<<<<<<< HEAD
        "1"=>{"1"=>[ #東京 1日目
            {timestamp:'10:00:00',content:'乃木坂駅'},
            {timestamp:'10:40:00',content:'サントリー美術館'},
            {timestamp:'11:15:00',content:'ミッドタウン・ガーデン'},
            {timestamp:'11:50:00',content:'檜町公園'},
            {timestamp:'12:40:00',content:'外務省外交史料館'},
            {timestamp:'13:20:00',content:'東京タワー'}
          ],
          "2" => [ #東京 2日目
            { timestamp: '10:00:00', content: 'KITTE(キッテ)' },
            { timestamp: '11:30:00', content: '伊勢廣 京橋本店' },
            { timestamp: '13:00:00', content: '三菱一号館美術館' },
            { timestamp: '15:00:00', content: '東急プラザ銀座' }
          ],
          "3" => [ #東京 3日目
            { timestamp: '10:30:00', content: 'いわて銀河プラザ' },
            { timestamp: '11:00:00', content: '銀座NAGANO' },
            { timestamp: '13:30:00', content: '銀座わしたショップ本店' },
            { timestamp: '14:30:00', content: '食の國 福井館' },
            { timestamp: '15:00:00', content: 'IBARAKI sense(イバラキセンス)' },
            { timestamp: '16:00:00', content: '北海道どさんこプラザ　有楽町店' }
          ]},

        "2"=>[ #北海道
            {timestamp:'09:15:00',content:'函館朝市'},
            {timestamp:'12:00:00',content:'金森赤レンガ倉庫'},
            {timestamp:'14:30:00',content:'八幡坂'},
            {timestamp:'16:00:00',content:'はこだて工芸舎'},
            {timestamp:'17:00:00',content:'函館山展望台'}
          ],
        "3"=>[ #愛知
            {timestamp:'10:00:00',content:'名古屋駅'},
            {timestamp:'10:45:00',content:'那古野街園'},
            {timestamp:'11:35:00',content:'景雲橋小園'},
            {timestamp:'12:30:00',content:'名古屋城'},
            {timestamp:'13:05:00',content:'名城公園'},
            {timestamp:'13:45:00',content:'名城公園フラワープラザ'}
          ],
        "4"=>[ #福岡
            {timestamp:'11:30:00',content:'麺劇場 玄瑛'},
            {timestamp:'13:30:00',content:'FUK COFFEE(フックコーヒー)'},
            {timestamp:'14:30:00',content:'福太郎 天神テルラ店'},
            {timestamp:'16:00:00',content:'博多麺もつ屋'},
            {timestamp:'18:00:00',content:'天神屋台街'}
=======
        "1"=>{1 =>[
            {timestamp:'11:00:00',content:'東京タワーに向かう'},
            {timestamp:'13:00:00',content:'メシ食べる'},
            {timestamp:'15:00:00',content:'スカイツリーに向かう'}
          ],
          2 => [
            { timestamp: '11:00:00', content: '東京タワーに向かう' },
            { timestamp: '13:00:00', content: 'メシ食べる' },
            { timestamp: '15:00:00', content: 'スカイツリーに向かう' },
>>>>>>> 51edeb2 (サンプル表示機能作成途中)
          ]
        }
      }
  end
end

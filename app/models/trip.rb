class Trip < ApplicationRecord
  has_many :trip_users, dependent: :destroy
  has_many :trip_contents, dependent: :destroy

  validates :name, presence: true
  validates :when, presence: true
  validates :name_of_trip, presence: true, length:{ maximum: 25 }
  validates :share_key, uniqueness: true, allow_blank: true

  attr_accessor :day

  enum trip_types: { 大阪: 0, 東京: 1, 北海道: 2, 愛知: 3, 福岡: 4 }

  def recommended_trips
    {
      "0"=>{"1"=>[ #大阪 1日目
          {timestamp: '10:00:00',content: 'アラビヤコーヒー'},
          {timestamp: '11:00:00',content: '難波八阪神社'},
          {timestamp: '12:30:00',content: 'お好み焼き・鉄板焼 ぼんくら家 道頓堀店'},
          {timestamp: '14:00:00',content: 'なんばグランド花月'},
          {timestamp: '16:00:00',content: 'KAMON HOTEL なんば'}
        ],
        "2" => [ #大阪 2日目
          { timestamp: '09:00:00', content: '勝尾寺' },
          { timestamp: '11:30:00', content: '箕面大滝' },
          { timestamp: '13:00:00', content: '楓来坊' },
          { timestamp: '14:00:00', content: 'かえで' },
          { timestamp: '16:00:00', content: '大江戸温泉物語 箕面温泉スパーガーデン' }
        ],
        "3" => [ #大阪 3日目
          { timestamp: '10:00:00', content: '豊國神社' },
          { timestamp: '11:00:00', content: 'アールジェイカフェ' },
          { timestamp: '12:45:00', content: '大阪市中央公会堂' },
          { timestamp: '14:00:00', content: 'JTRRD cafe&season0' },
          { timestamp: '15:30:00', content: 'アメリカ村' }
        ]},
      "1"=>{"1"=>[ #東京 1日目
          {timestamp: '10:00:00',content: '乃木坂駅'},
          {timestamp: '10:40:00',content: 'サントリー美術館'},
          {timestamp: '11:15:00',content: 'ミッドタウン・ガーデン'},
          {timestamp: '11:50:00',content: '檜町公園'},
          {timestamp: '12:40:00',content: '外務省外交史料館'},
          {timestamp: '13:20:00',content: '東京タワー'}
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

      "2"=>{"1"=>[ #北海道 1日目
          { timestamp: '10:00:00', content: '札幌市時計台' },
          { timestamp: '11:30:00', content: 'バリスタート コーヒー' },
          { timestamp: '12:00:00', content: '大通公園' },
          { timestamp: '15:00:00', content: '札幌市円山動物園' },
          { timestamp: '19:00:00', content: 'ジンギスカン 羊飼いの店' },
          { timestamp: '21:00:00', content: 'パフェ 珈琲 酒「佐藤」' }
        ],
        "2" => [ #北海道 2日目
          { timestamp: '9:00:00', content: '函館ハリストス正教会' },
          { timestamp: '10:30:00', content: '五稜郭公園' },
          { timestamp: '13:20:00', content: 'カントリーキッチンWALD' },
          { timestamp: '14:00:00', content: '大沼森林公園' },
        ],
        "3" => [ #北海道 3日目
          { timestamp: '09:00:00', content: 'サロマ湖鶴雅リゾート' },
          { timestamp: '11:00:00', content: '常呂川' },
          { timestamp: '13:00:00', content: 'ホテル黒部' },
          { timestamp: '15:00:00', content: 'パティスリー ノブヤ' },
          { timestamp: '18:30:00', content: '滝の湯公園' },
          { timestamp: '20:00:00', content: '塩別つるつる温泉' }
        ]},
      "3"=>{"1"=>[ #愛知 1日目
          { timestamp: '09:00:00', content: '名古屋城'},
          { timestamp: '10:00:00', content: '熱田神宮'},
          { timestamp: '12:00:00', content: '矢場とん本店'},
          { timestamp: '13:00:00', content: '大須商店街'},
          { timestamp: '17:00:00', content: 'オアシス21'},
          { timestamp: '19:00:00', content: '世界の山ちゃん'}
        ],
        "2" => [ #愛知 2日目
          { timestamp: '10:00:00', content: '愛・地球博記念公園' },
          { timestamp: '12:30:00', content: '大須観音' },
          { timestamp: '14:00:00', content: '名古屋港水族館' },
          { timestamp: '17:00:00', content: 'シートレインランド' },
          { timestamp: '19:00:00', content: '味仙' },
        ],
        "3" => [ #愛知 3日目
          { timestamp: '09:00:00', content: 'トヨタ博物館' },
          { timestamp: '11:00:00', content: '三州足助屋敷' },
          { timestamp: '13:00:00', content: '郷土料理 一の谷' },
          { timestamp: '14:30:00', content: '香嵐渓' },
          { timestamp: '15:00:00', content: '城跡公園足助城' },
          { timestamp: '18:00:00', content: '東山スカイタワー' }
        ]},
      "4"=>{"1"=>[ #福岡 1日目
          { timestamp: '11:30:00', content: '西の浦イカ活造り波平'},
          { timestamp: '13:30:00', content: '桜井二見ヶ浦'},
          { timestamp: '15:00:00', content: 'マリノアシティ福岡'},
          { timestamp: '17:00:00', content: '福岡タワー'},
          { timestamp: '19:00:00', content: '博多もつ鍋やま中赤坂店'},
          { timestamp: '21:00:00', content: '福岡博多屋台' }
        ],
        "2" => [ #福岡 2日目
          { timestamp: '09:15:00', content: '福岡市能古渡船場' },
          { timestamp: '10:45:00', content: '能古島' },
          { timestamp: '12:00:00', content: 'のこの市' },
          { timestamp: '13:15:00', content: 'のこのしまアイランドパーク' },
          { timestamp: '14:30:00', content: '耕ちゃんうどん' },
          { timestamp: '16:00:00', content: '能古島キャンプ村・海水浴場' }
        ],
        "3" => [ #福岡 3日目
          { timestamp: '10:30:00', content: '麺劇場 玄瑛' },
          { timestamp: '13:30:00', content: 'FUK COFFEE(フックコーヒー)' },
          { timestamp: '14:30:00', content: '福太郎 天神テルラ店' },
          { timestamp: '16:00:00', content: '博多麺もつ屋' },
          { timestamp: '18:00:00', content: '天神屋台街' }
        ]},
      }
  end
end

class Trip < ApplicationRecord
  has_many :trip_users, dependent: :destroy
  has_many :trip_contents, dependent: :destroy

  validates :destination, presence: true
  validates :start_at, presence: true
  validates :title, presence: true, length:{ maximum: 25 }
  validates :share_key, uniqueness: true, allow_blank: true

  attr_accessor :day

  enum trip_types: { 大阪: 0, 東京: 1, 北海道: 2, 愛知: 3, 福岡: 4 }

  def recommended_trips
    {
      "0"=>{"1"=>[ #大阪 1日目
          {scheduled_time: '10:00:00',schedule: 'アラビヤコーヒー'},
          {scheduled_time: '11:00:00',schedule: '難波八阪神社'},
          {scheduled_time: '12:30:00',schedule: 'お好み焼き・鉄板焼 ぼんくら家 道頓堀店'},
          {scheduled_time: '14:00:00',schedule: 'なんばグランド花月'},
          {scheduled_time: '16:00:00',schedule: 'KAMON HOTEL なんば'}
        ],
        "2" => [ #大阪 2日目
          { scheduled_time: '09:00:00', schedule: '勝尾寺' },
          { scheduled_time: '11:30:00', schedule: '箕面大滝' },
          { scheduled_time: '13:00:00', schedule: '楓来坊' },
          { scheduled_time: '14:00:00', schedule: 'かえで' },
          { scheduled_time: '16:00:00', schedule: '大江戸温泉物語 箕面温泉スパーガーデン' }
        ],
        "3" => [ #大阪 3日目
          { scheduled_time: '10:00:00', schedule: '豊國神社' },
          { scheduled_time: '11:00:00', schedule: 'アールジェイカフェ' },
          { scheduled_time: '12:45:00', schedule: '大阪市中央公会堂' },
          { scheduled_time: '14:00:00', schedule: 'JTRRD cafe&season0' },
          { scheduled_time: '15:30:00', schedule: 'アメリカ村' }
        ]},
      "1"=>{"1"=>[ #東京 1日目
          {scheduled_time: '10:00:00',schedule: '乃木坂駅'},
          {scheduled_time: '10:40:00',schedule: 'サントリー美術館'},
          {scheduled_time: '11:15:00',schedule: 'ミッドタウン・ガーデン'},
          {scheduled_time: '11:50:00',schedule: '檜町公園'},
          {scheduled_time: '12:40:00',schedule: '外務省外交史料館'},
          {scheduled_time: '13:20:00',schedule: '東京タワー'}
        ],
        "2" => [ #東京 2日目
          { scheduled_time: '10:00:00', schedule: 'KITTE(キッテ)' },
          { scheduled_time: '11:30:00', schedule: '伊勢廣 京橋本店' },
          { scheduled_time: '13:00:00', schedule: '三菱一号館美術館' },
          { scheduled_time: '15:00:00', schedule: '東急プラザ銀座' }

        ],
        "3" => [ #東京 3日目
          { scheduled_time: '10:30:00', schedule: 'いわて銀河プラザ' },
          { scheduled_time: '11:00:00', schedule: '銀座NAGANO' },
          { scheduled_time: '13:30:00', schedule: '銀座わしたショップ本店' },
          { scheduled_time: '14:30:00', schedule: '食の國 福井館' },
          { scheduled_time: '15:00:00', schedule: 'IBARAKI sense(イバラキセンス)' },
          { scheduled_time: '16:00:00', schedule: '北海道どさんこプラザ　有楽町店' }
        ]},

      "2"=>{"1"=>[ #北海道 1日目
          { scheduled_time: '10:00:00', schedule: '札幌市時計台' },
          { scheduled_time: '11:30:00', schedule: 'バリスタート コーヒー' },
          { scheduled_time: '12:00:00', schedule: '大通公園' },
          { scheduled_time: '15:00:00', schedule: '札幌市円山動物園' },
          { scheduled_time: '19:00:00', schedule: 'ジンギスカン 羊飼いの店' },
          { scheduled_time: '21:00:00', schedule: 'パフェ 珈琲 酒「佐藤」' }
        ],
        "2" => [ #北海道 2日目
          { scheduled_time: '9:00:00', schedule: '函館ハリストス正教会' },
          { scheduled_time: '10:30:00', schedule: '五稜郭公園' },
          { scheduled_time: '13:20:00', schedule: 'カントリーキッチンWALD' },
          { scheduled_time: '14:00:00', schedule: '大沼森林公園' },
        ],
        "3" => [ #北海道 3日目
          { scheduled_time: '09:00:00', schedule: 'サロマ湖鶴雅リゾート' },
          { scheduled_time: '11:00:00', schedule: '常呂川' },
          { scheduled_time: '13:00:00', schedule: 'ホテル黒部' },
          { scheduled_time: '15:00:00', coschedulentent: 'パティスリー ノブヤ' },
          { scheduled_time: '18:30:00', schedule: '滝の湯公園' },
          { scheduled_time: '20:00:00', schedule: '塩別つるつる温泉' }
        ]},
      "3"=>{"1"=>[ #愛知 1日目
          { scheduled_time: '09:00:00', schedule: '名古屋城'},
          { scheduled_time: '10:00:00', schedule: '熱田神宮'},
          { scheduled_time: '12:00:00', schedule: '矢場とん本店'},
          { scheduled_time: '13:00:00', schedule: '大須商店街'},
          { scheduled_time: '17:00:00', schedule: 'オアシス21'},
          { scheduled_time: '19:00:00', schedule: '世界の山ちゃん'}
        ],
        "2" => [ #愛知 2日目
          { scheduled_time: '10:00:00', schedule: '愛・地球博記念公園' },
          { scheduled_time: '12:30:00', schedule: '大須観音' },
          { scheduled_time: '14:00:00', schedule: '名古屋港水族館' },
          { scheduled_time: '17:00:00', schedule: 'シートレインランド' },
          { scheduled_time: '19:00:00', schedule: '味仙' },
        ],
        "3" => [ #愛知 3日目
          { scheduled_time: '09:00:00', schedule: 'トヨタ博物館' },
          { scheduled_time: '11:00:00', schedule: '三州足助屋敷' },
          { scheduled_time: '13:00:00', schedule: '郷土料理 一の谷' },
          { scheduled_time: '14:30:00', schedule: '香嵐渓' },
          { scheduled_time: '15:00:00', schedule: '城跡公園足助城' },
          { scheduled_time: '18:00:00', schedule: '東山スカイタワー' }
        ]},
      "4"=>{"1"=>[ #福岡 1日目
          { scheduled_time: '11:30:00', schedule: '西の浦イカ活造り波平'},
          { scheduled_time: '13:30:00', schedule: '桜井二見ヶ浦'},
          { scheduled_time: '15:00:00', schedule: 'マリノアシティ福岡'},
          { scheduled_time: '17:00:00', schedule: '福岡タワー'},
          { scheduled_time: '19:00:00', schedule: '博多もつ鍋やま中赤坂店'},
          { scheduled_time: '21:00:00', schedule: '福岡博多屋台' }
        ],
        "2" => [ #福岡 2日目
          { scheduled_time: '09:15:00', schedule: '福岡市能古渡船場' },
          { scheduled_time: '10:45:00', schedule: '能古島' },
          { scheduled_time: '12:00:00', schedule: 'のこの市' },
          { scheduled_time: '13:15:00', schedule: 'のこのしまアイランドパーク' },
          { scheduled_time: '14:30:00', schedule: '耕ちゃんうどん' },
          { scheduled_time: '16:00:00', schedule: '能古島キャンプ村・海水浴場' }
        ],
        "3" => [ #福岡 3日目
          { scheduled_time: '10:30:00', schedule: '麺劇場 玄瑛' },
          { scheduled_time: '13:30:00', schedule: 'FUK COFFEE(フックコーヒー)' },
          { scheduled_time: '14:30:00', schedule: '福太郎 天神テルラ店' },
          { scheduled_time: '16:00:00', schedule: '博多麺もつ屋' },
          { scheduled_time: '18:00:00', schedule: '天神屋台街' }
        ]},
      }
  end
end

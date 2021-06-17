class Theme < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '国際交流' },
    { id: 3, name: '子ども・教育' },
    { id: 4, name: '震災・災害' },
    { id: 5, name: '地域活性化・まちづくり' },
    { id: 6, name: '環境問題' },
    { id: 7, name: '貧困・人権問題' },
    { id: 8, name: '福祉・高齢者交流・障がい者支援' },
    { id: 9, name: 'スポーツ・運動' },
    { id: 10, name: '芸術・文化・教養' },
    { id: 11, name: '動物愛護' },
    { id: 12, name: '医療・介護' },
    { id: 13, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :users
end
class Category < ActiveHash::Base
  self.data = [
    {id: 0,name: 'レディース'}, {id: 1,name: 'メンズ'}, {id: 2,name: 'ベビー・キッズ'}, {id: 3,name: 'インテリア・住まい・小物'},
    {id: 4,name: '本・音楽・ゲーム'}
  ]
end  
class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: 'レディース' }, { id: 2, name: 'メンズ' }, { id: 3, name: 'ベビー・キッズ' }, { id: 4, name: 'インテリア・住まい・小物' },
    { id: 5, name: '本・音楽・ゲーム' }
  ]
end

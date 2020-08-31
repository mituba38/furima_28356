class Status < ActiveHash::Base
  self.data =[
    {id: 1,name: '新品'}, {id: 2,name: '未使用に近い'}, {id: 3,name: '目立った傷や汚れなし'},
    {id: 4,name: '傷や汚れあり'}, {id: 5,name: '全体的な状態が悪い'}
  ]
end
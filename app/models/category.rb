class Category < ActiveHash::Base
  self.data = [
   { id: 1, name: '--' },
   { id: 2, name: 'レディース' },
   { id: 3, name: 'メンズ' },
   { id: 4, name: 'ベビー・キッズ' },
   { id: 5, name: 'インテリア・住まい・小物' },
   { id: 6, name: 'おもちゃ・ホビー・グッズ' },
   { id: 7, name: '家電・スマホ・カメラ' },
   { id: 8, name: 'スポーツ・レジャー' },
   { id: 9, name: 'ハンドメイド' },
   { id: 10, name: 'その他' }
 ]
  include ActiveHash::Associations 
  has_many :items

end

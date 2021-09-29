class Invite < ApplicationRecord
#招待メールを送信する前にトークンを作成させる。 
  before_create :generate_token

  
  private
#トークン生成についてハッシュ化を実施する。
#Time.currentで日本時間にしている。randメソッドで乱数を使用。
#ハッシュ化する値はfamily_id、生成した時間、乱数を結合したもの
   def generate_token
    self.token = Digest::SHA1.hexdigest([self.family_id, Time.current, rand].join)
   end
  
end

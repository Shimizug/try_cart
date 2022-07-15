class CartItem < ApplicationRecord
  belongs_to :user 
  belongs_to :cart
  
  # 税込み単価の算出
  def with_tax_price
      (price * 1.1).floor
  end
  
  # 小計の算出
  def subtotal
      item.with_tax_price * amount
  end
end

class CareItemsController < ApplicationController
before_action :authenticate_user!

  def destroy_all
    current_user.cart_items.destroy_all
    redirect_to request.referer
  end

  def destory
      @cart_item.destroy
      redirect_to current_cart
  end

  def index
    @cart_item = Cartitem.new   #この記述はitem_detailのページにも記載,新規投稿のために使用
    @cart_items = Cartitems.all #ログイン中のユーザに結びついたカートアイテムが欲しい
    @total    #合計金額の算出に使用する変数
  end

  def create
    binding.pry
    @cart = Cartitem.new(cart_item_params)
    @cart.user_id = current_user.id
    if Item.find_by(item.id:item_id )
        #元々の個数と新たな個数の合算をここに作成
      redirect_to cart_items_path
    else
      @cart.save
      redirect_to cart_items_path
    end
  end

  def update
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end


end

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
    @cart_items = current_customer.cart_items #ログイン中のユーザに結びついたカートアイテムが欲しい
    @total    #合計金額の算出に使用する変数
  end

  def create
    @cart_item = Cartitem.new(cart_item_params)
    @cart_item.user_id = current_user.id
    if Item.find_by(item.id:item_id )
        #元々の個数と新たな個数の合算をここに作成
      redirect_to cart_items_path
    else
      @cart_item.save
      redirect_to cart_items_path
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to request.referer
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end

end

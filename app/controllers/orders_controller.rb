class OrdersController < ApplicationController

 def index
  @item = Item.find(params[:item_id])
  @order_destination = OrderDestination.new
 end

 def create
   @item = Item.find(params[:item_id])
   @order_destination = OrderDestination.new(destination_params)   
  if @order_destination.valid?
    pay_item
    @order_destination.save
    redirect_to root_path
  else
   render :index
 end
end


 private

 def destination_params
  params.require(:order_destination).permit(:post_code, :state_id, :city,:address,:building_name,:phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
 end

 def pay_item
  Payjp.api_key = "sk_test_ec86e57ca7718a3b3efe64a0"  # PAY.JPテスト秘密鍵
  Payjp::Charge.create(
    amount: @item.price,  # 商品の値段
    card: destination_params[:token],    # カードトークン
    currency:'jpy'                 # 通貨の種類(日本円)
  )
 end
end

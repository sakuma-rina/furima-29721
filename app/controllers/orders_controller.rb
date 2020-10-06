class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_params, only: [:index, :create]

  def index
    if current_user.id == @item.user_id || @item.order.id.present?
      redirect_to root_path
    else
      @order_destination = OrderDestination.new
    end
  end

  def create
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
    params.require(:order_destination).permit(:post_code, :state_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: destination_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end

  def set_params
    @item = Item.find(params[:item_id])
  end
end

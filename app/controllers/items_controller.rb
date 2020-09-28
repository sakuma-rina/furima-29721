class ItemsController < ApplicationController
  before_action :authenticate_user!,only: :new

  def index
  end

  def new
    @item = Item.new
    end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:product_name,:description,:category_id,:condition_id,:fee_id,:address_id,:days_id,:price,:image).merge(user_id: current_user.id)
  end

end
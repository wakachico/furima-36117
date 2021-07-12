class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def pay_item
    Payjp.api_key = "sk_test_c15578ac9893fb3c223c2649"
    Payjp::Charge.create(
        amount: Item.find(order_params[:item_id]).selling_price,
        card: order_params[:token],
        currency: 'jpy'
    )
  end

  def order_params
    params.require(:order_address).permit(
      :postal_code, :prefecture_id, :city, :block, :building, :phone_number
    ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end

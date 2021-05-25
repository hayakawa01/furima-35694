class OrdersController < ApplicationController
  before_action :choose_item,only:[:index,:create]
  before_action :authenticate_user!,only:[:index,:create]
  before_action :correct_order,only:[:index,:create]
  before_action :soldout_order,only:[:index,:create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      order_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private 
  def order_params
    params.require(:order_address).permit(:postal_code,:prefecture_id,:municipality,:house_number,:building_name,:phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def choose_item
    @item = Item.find(params[:item_id])
  end

  def correct_order
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def soldout_order
    if @item.order.present?
      redirect_to root_path
    end
  end

  def order_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end
end

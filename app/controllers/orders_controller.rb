class OrdersController < ApplicationController
  before_action :set_item, only: [:index,:create]

  def index
    @order = OrderInfo.new
  end

  def show
  end

  def create
    @order = OrderInfo.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private
  
  def set_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.order.present?
  end



  def order_params
      params.permit(:telephone_number, :area, :postal_code, :city, :house_number, :building_name, :item_id, :token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],    
      currency:'jpy'                
    )
  end
end

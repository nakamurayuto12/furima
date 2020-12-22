class PurchaseManagementsController < ApplicationController
  before_action :set_params, only: [:index, :create]
  before_action :authenticate_user!

  def index
    if user_signed_in? && current_user.id != @item.user_id && @item.purchase_management == nil
      @purchase_management_purchased = PurchaseManagementPurchased.new
    else
      redirect_to root_path
    end
  end

  def create
    @purchase_management_purchased = PurchaseManagementPurchased.new(purchased_params)
     if @purchase_management_purchased.valid?
        pay_item
        @purchase_management_purchased.save
        redirect_to root_path
     else
       render action: :index
     end
  end
  
  private

  def purchased_params
    params.require(:purchase_management_purchased).permit(:shipping_address, :postal_code, :phone_number, :municipalities, :address_id, :building, :purchase_management_id).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def set_params
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: params[:token],
        currency: 'jpy'
      )
  end
  
end
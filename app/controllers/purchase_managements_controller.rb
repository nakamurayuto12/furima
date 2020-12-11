class PurchaseManagementsController < ApplicationController
  before_action :set_params, only: [:index, :create]

  def index
    @purchase_management_purchased = PurchaseManagementPurchased.new
  end

  def new
  end

  def create
    @purchase_management_purchased = PurchaseManagementPurchased.new(purchased_params)
     if @purchase_management_purchased.valid?
       @purchase_management_purchased.save
       redirect_to root_path
     else
       render action: :index
     end
  end
  
  private

  def purchased_params
    params.require(:purchase_management_purchased).permit(:shipping_address, :postal_code, :phone_number, :municipalities, :address_id, :building, :user_id, :item_id, :purchase_management_id)
  end

  def set_params
    @item = Item.find(params[:item_id])
  end
end
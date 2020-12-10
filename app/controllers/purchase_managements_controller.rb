class PurchaseManagementsController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    @purchase_managment = PurchaseManagment.new
  end

  def create
    @purchase_managment = PurchaseManagment.new(order_params)
    if @purchase_managment.valid?
      @purchase_managment.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
end

class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :correct_purchase_record, only: [:index, :create]
  before_action :item_sold, only: [:index, :create]
  before_action :set_item, only: [:index, :create, :purchase_record_params, :correct_purchase_record, :item_sold]

  def index
    @purchase_record_address = PurchaseRecordAddress.new
  end

  def create
    @purchase_record_address = PurchaseRecordAddress.new(purchase_record_params)
    if @purchase_record_address.valid?
      pay_item
      @purchase_record_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_record_params
    params.require(:purchase_record_address).permit(:postal_code, :area_id, :municipality, :house_number, :building, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def correct_purchase_record
    redirect_to root_path if @item.user.id == current_user.id
  end

  def item_sold
    redirect_to root_path if @item.purchase_record.present?
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_record_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end

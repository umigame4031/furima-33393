class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :correct_item, only: [:edit, :update, :destroy]
  before_action :item_sold, only: [:edit, :update]

  def index
    @items = Item.all.order(created_at: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @item.destroy
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :state_id, :delivery_fee_id, :area_id, :days_id, :price,
                                 :image).merge(user_id: current_user.id)
  end

  def correct_item
    redirect_to root_path unless @item.user.id == current_user.id
  end

  def item_sold
    set_item
    redirect_to root_path if @item.purchase_record.present?
  end
end

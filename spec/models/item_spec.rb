require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it 'name,text,price,category_id,state_id,delivery_fee_id,area_id,days_id,imageが存在していれば保存できる' do
      expect(@item).to be_valid
    end

    it 'nameが空では保存できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'textが空では保存できない' do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end

    it 'priceが空では保存できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが300より小さいと保存できない' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it 'priceが9,999,999より大きいと保存できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end

    it 'priceが半角数字でないと保存できない' do
      @item.price = '100$'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    it 'category_idが空では保存できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'category_idが1では保存できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end

    it 'state_idが空では保存できない' do
      @item.state_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("State can't be blank")
    end

    it 'state_idが1では保存できない' do
      @item.state_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('State must be other than 1')
    end

    it 'delivery_fee_idが空では保存できない' do
      @item.delivery_fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
    end

    it 'delivery_fee_idが1では保存できない' do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
    end

    it 'area_idが空では保存できない' do
      @item.area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
    end

    it 'area_idが1では保存できない' do
      @item.area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Area must be other than 1')
    end

    it 'days_idが空では保存できない' do
      @item.days_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Days can't be blank")
    end

    it 'days_idが1では保存できない' do
      @item.days_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Days must be other than 1')
    end

    it 'imageが空では保存できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'userが紐付いていないと保存できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end

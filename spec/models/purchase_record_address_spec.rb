require 'rails_helper'

RSpec.describe PurchaseRecordAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @purchase_record_address = FactoryBot.build(:purchase_record_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_record_address).to be_valid
    end
    it 'postal_codeが空だと保存できない' do
      @purchase_record_address.postal_code = ''
      @purchase_record_address.valid?
      expect(@purchase_record_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'area_idが空だと保存できない' do
      @purchase_record_address.area_id = ''
      @purchase_record_address.valid?
      expect(@purchase_record_address.errors.full_messages).to include("Area can't be blank")
    end
    it 'municipalityが空だと保存できない' do
      @purchase_record_address.municipality = ''
      @purchase_record_address.valid?
      expect(@purchase_record_address.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'house_numberが空だと保存できない' do
      @purchase_record_address.house_number = ''
      @purchase_record_address.valid?
      expect(@purchase_record_address.errors.full_messages).to include("House number can't be blank")
    end
    it 'phone_numberが空だと保存できない' do
      @purchase_record_address.phone_number = ''
      @purchase_record_address.valid?
      expect(@purchase_record_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'postal_codeにハイフンがないと保存できない' do
      @purchase_record_address.postal_code = '1234567'
      @purchase_record_address.valid?
      expect(@purchase_record_address.errors.full_messages).to include("Postal code Include hyphen(-)")
    end
    it 'phone_numberにハイフンがあると保存できない' do
      @purchase_record_address.phone_number = '090-12-456'
      @purchase_record_address.valid?
      expect(@purchase_record_address.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberが11桁より多いと保存できない' do
      @purchase_record_address.phone_number = '090123456789'
      @purchase_record_address.valid?
      expect(@purchase_record_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
    it 'tokenが空では保存できない' do
      @purchase_record_address.token = nil
      @purchase_record_address.valid?
      expect(@purchase_record_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end

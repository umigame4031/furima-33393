class PurchaseRecordAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :municipality, :house_number, :building, :phone_number, :purchase_record_id 

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Include hyphen(-)" }
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality
    validates :house_number
    validates :phone_number, format: {with: /\A[0-9]+\z/ }, length: {in: 1..11}
  end

  def save
    purchase_record = PurchaseRecord.create!(user_id: user_id, item_id: item_id)
    Address.create!(postal_code: postal_code, area_id: area_id, municipality: municipality, house_number: house_number, building: building, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end
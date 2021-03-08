class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :days
  belongs_to :delivery_fee
  belongs_to :state

  belongs_to :user
  has_one_attached :image
  has_one :purchase_record

  with_options presence: true do
    validates :name
    validates :text
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :state_id
      validates :delivery_fee_id
      validates :area_id
      validates :days_id
    end
  end
end

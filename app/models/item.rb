class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area, :category, :days, :delivery_fee, :state

  belongs_to :user

  with_options presence: true do
    validates :name
    validates :text
    validates :price, numericality: { greater_than_or_equal_to: 300 }, numericality: { less_than_or_equal_to: 9999999 }
    validates :user
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :state_id
      validates :delivery_fee_id
      validates :area_id
      validates :days_id
    end
  end
end

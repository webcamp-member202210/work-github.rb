class OrderDetail < ApplicationRecord
  belongs_to :orders
  belongs_to :items
  
  validates :price, presence: true
  validates :amount, presence: true
  validates :making_status, presence: true
end

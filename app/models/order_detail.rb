class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  validates :price, presence: true
  validates :amount, presence: true
  validates :making_status, presence: true
  
  enum making_status: { cannot_manufactured: 0, waiting: 1, production: 2, complete: 3 }
end

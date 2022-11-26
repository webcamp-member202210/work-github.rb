class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

  validates :postal_code, presence: true
  validates :address_code, presence: true
  validates :name, presence: true
  validates :postage, presence: true
  validates :bill, presence: true
  validates :payment_method, presence: true
  validates :status, presence: true
  validates :customer_id, presence: true

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting: 0, confirm: 1, production: 2, preparation: 3, sent: 4 }
end

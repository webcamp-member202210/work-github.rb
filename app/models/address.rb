class Address < ApplicationRecord
  def address_display
    "〒" + postal_code + " " + address + " " + name
  end
  
  validates :customer_id, presence: true
  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
end

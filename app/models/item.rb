class Item < ApplicationRecord
  has_one_attached :image
  has_many :order_details
  has_many :cart_items
  belongs_to :genre

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :genre_id, presence: true
  validates :image, presence: true



  def get_image(width, height)
    image
  end
end

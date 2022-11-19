class Item < ApplicationRecord
  has_one_attached :image
  has_many :order_details
  has_many :cart_items
  belongs_to :genre
  
  
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default_image.jpeg')
      image..attach(io: File.open(file_path), filename: 'default-image.jpeg',  contant_type: 'image/jpeg')
    end
    image
  end
end

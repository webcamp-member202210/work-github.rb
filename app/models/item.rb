class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default_image.jpeg')
      image..attach(io: File.open(file_path), filename: 'default-image.jpeg',  contant_type: 'image/jpeg')
    end
    image
  end
end

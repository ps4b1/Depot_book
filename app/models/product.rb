class Product < ApplicationRecord
  validates :description, :title, :image_url, presence: true
  validates :title, presence: true, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|png|jpg)\z}i,
    message: "Must be a valid url for jpg, gif and png format"
  }
  validates :price, numericality: { greater_than_or_equal_to: 0.01}
end

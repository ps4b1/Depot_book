class Product < ApplicationRecord
  validates :description, :title, :image_url, presence: true
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif,png,hpg)\z}i,
    message: "Must be a valid url fot jpg, gif and png"
  }
  validates :price, numericality: { greater_than_or_equal_to: 0.1}
end

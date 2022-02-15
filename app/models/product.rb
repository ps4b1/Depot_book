# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :line_items
  has_many :reviews, dependent: :destroy
  has_many :orders, through: :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  validates :description, :title, :image_url, presence: true
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with: /\.(gif|png|jpg)\z/i,
    message: 'Must be a valid url for jpg, gif and png format'
  }
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }

  def average_rating
    reviews.average(:rating)
  end

  private

  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line Items present')
      throw :abort
    end
  end
end

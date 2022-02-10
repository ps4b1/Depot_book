# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :product
  validates :rating, numericality: { greater_than: 1, less_than_or_equal_to: 5 }
end

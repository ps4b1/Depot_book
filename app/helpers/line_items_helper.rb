# frozen_string_literal: true

module LineItemsHelper
  def sum_of_quantity(cart)
    cart.line_items.sum(:quantity)
  end
end

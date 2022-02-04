# frozen_string_literal: true

module ApplicationHelper
  def render_if(condition, record)
    render record if condition
  end

  def top_list
    Product.all.order(:times_bought).reverse
  end
end

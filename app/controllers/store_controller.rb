# frozen_string_literal: true

class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def index
    @products = Product.order(:title)
    @counter = session_counter
  end

  private

  def session_counter
    session[:counter] = 0 if session[:counter].nil?
    session[:counter] += 1
  end
end

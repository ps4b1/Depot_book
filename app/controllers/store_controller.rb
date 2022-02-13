# frozen_string_literal: true

class StoreController < ApplicationController
  skip_before_action :authorize
  include CurrentCart
  before_action :set_cart
  def index
    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale])
    else
      @products = Product.order(:title)
      @counter = session_counter
    end
  end

  private

  def session_counter
    session[:counter] = 0 if session[:counter].nil?
    session[:counter] += 1
  end
end

# frozen_string_literal: true

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  test 'product attributes must not be empty' do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test 'product price must be positive' do
    product = Product.new(title: 'my Book title', description: 'yyy', image_url: 'iphone.png')

    product.price = 1
    assert product.valid?

    product.price = -1
    assert product.invalid?
    assert_equal ['must be greater than or equal to 0.01'], product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ['must be greater than or equal to 0.01'], product.errors[:price]
  end

  def product_without_img(image_url)
    Product.new(title: 'Knjiga', description: 'xxx', price: 1, image_url: image_url)
  end

  test 'image url' do
    # zbog uniq ne radi
    ok = %w[fred.jpg fred.png fred.gif FRED.JPG FRED.Jpg http://a/b/c/fred.gif]
    bad = %w[fred.doc fred.gif/more fred.gif.more]
    ok.each do |image_url|
      assert product_without_img(image_url).valid?, "#{image_url} should be valid"
    end
    bad.each do |image_url|
      assert product_without_img(image_url).invalid?, "#{image_url} shouldn't be valid"
    end
  end

  test 'product is not valid without unique title' do
    product = Product.new(title: products(:ruby).title, description: 'test product', price: 1, image_url: 'crystal.jpg')

    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')], product.errors[:title]
  end
end

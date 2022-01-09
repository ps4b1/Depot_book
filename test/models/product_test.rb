require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "product attributes must not be empty" do
    product=Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "product price must be positive" do
    product = Product.new(title: "my Book title", description: "yyy", image_url: "iphone.png")

    product.price =1
    assert product.valid?

    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]
  end

  def new_product(image_url)
    Product.new(title: products(:one).title, description: "xxx", price: 1, image_url: image_url)
  end


  test "image url" do
    ok= %w{fred.jpg fred.png fred.gif FRED.JPG FRED.Jpg http://a/b/c/fred.gif}
    bad=%w{fred.doc fred.gif/more fred.gif.more}

    ok.each do |image_url|
      assert new_product(image_url).valid?, "#{image_url} shouldn't be valid"
    end
    bad.each do |image_url|
      assert new_product(image_url).invalid?, "#{image_url} shouldn't be valid"
    end
  end
end

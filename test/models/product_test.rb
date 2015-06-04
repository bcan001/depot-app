require 'test_helper'

# VALIDATION TESTING (UNIT TESTING FOR MODELS)
class ProductTest < ActiveSupport::TestCase
	# load our fixtures file (products.yml file)
	fixtures :products
	# test validation of unique product titles:
	test "product is not valid without a unique title" do
		product = Product.new(title: products(:ruby).title, description: "yyy", price: 1, image_url: "fred.gif")
		assert product.invalid?
		assert_equal ["has already been taken"], product.errors[:title]
	end


  test "product attributes must not be empty" do
  	product = Product.new
  	assert product.invalid?
  	assert product.errors[:title].any?
  	assert product.errors[:description].any?
  	assert product.errors[:price].any?
  	assert product.errors[:image_url].any?
  end

  test "product price must be positive" do
  	# product = Product.new(title: "My Book Title", description: "yyy", image_url: "zzz.jpg")
  	product = products(:ruby)

  	product.price = -1
  	assert product.invalid?
  	assert_equal(["must be greater than or equal to 0.01"], product.errors[:price])

  	product.price = 1
  	assert product.valid?
  end



  # test that the validating image URL ends with gif, png, or jpg
  def new_product(image_url)
  	Product.new(title: "My Book Title", description: "yyy", image_url: image_url)
  end
  test "image_url" do
  	ok = %w{ fred.gif fred.jpg fred.png }
  	bad = %w{ fred.doc fred.xyz fred.jjj }
  	ok.each do |name|
  		assert new_product(name).valid?, "#{name} should be valid"
  	end
  	bad.each do |name|
  		assert new_product(name).invalid?, "#{name} should'nt be valid"
  	end
  end

end












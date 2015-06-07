class Product < ActiveRecord::Base
	# validate that these fields exist upon creation of a product:
	validates(:title, :description, :image_url, presence: true)
	# validate that price is a number upon product creation
	validates(:price, numericality: {greater_than_or_equal_to: 0.01})
	# validate that each product title is unique upon creation
	validates(:title, uniqueness: true)
	# validate that the URL added for the image does exist
	validates(:image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\Z}i,
		message: 'must be a URL for GIF, JPG, or PNG image'
	})

	# caching
	def self.latest
		Product.order(:updated_at).last
	end
end

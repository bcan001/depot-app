class Cart < ActiveRecord::Base
	# line_items contained in the cart will be destroyed if the Cart is destroyed
	has_many :line_items, dependent: :destroy

	# if there is already the same item in the cart, increment the quantity by 1
	def add_product(product_id)
		current_item = line_items.find_by(product_id: product_id)
		if current_item
			current_item.quantity += 1
		else
			current_item = line_items.build(product_id: product_id)
		end
		current_item
	end
end

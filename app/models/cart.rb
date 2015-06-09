class Cart < ActiveRecord::Base
	# line_items contained in the cart will be destroyed if the Cart is destroyed
	has_many :line_items, dependent: :destroy
end

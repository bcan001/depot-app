module CurrentCart
	# Basically, the idea is to extract common and / or context specific chunks of code in order to clean up the models and avoid them getting too fat and messy.
	# This module can be added to any class to share its functionality
	extend ActiveSupport::Concern

	private
		def set_cart
			@cart = Cart.find(session[:cart_id])
		rescue ActiveRecord::RecordNotFound # use rescue to catch an error, in case a cart does not exist yet
			@cart = Cart.create
			session[:cart_id] = @cart.id
		end

end




class StoreController < ApplicationController
	# display all the available products on the homepage
  def index
  	@products = Product.order(:title)
  end
end

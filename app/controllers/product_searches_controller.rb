class ProductSearchesController < ApplicationController

  # GET /searches
  def index
    if params[:search]
      @items = ProductSearch.find_or_create_by(query: params[:search]).get_products
      fresh_when @items
    end
  end
end

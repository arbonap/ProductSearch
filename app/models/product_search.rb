require 'semantics3'

class ProductSearch < ApplicationRecord

  def get_products
    #CACHING!!!!!!!!!!!!!! 😎
    results || create_results
  end

  def create_results
    results = Sem3SearchService.new({search: query}).get_products["results"]
    update(results: results)
    results
   end
end

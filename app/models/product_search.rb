require 'semantics3'

class ProductSearch < ApplicationRecord
  validates_presence_of :query, :results
  validates_uniqueness_of :query

  def get_products
    results || create_results
  end

  def create_results
    results = Sem3SearchService.new({search: query}).execute["results"]
    update(results: results)
    results
  end
end

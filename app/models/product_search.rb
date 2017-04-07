require 'semantics3'

class ProductSearch < ActiveRecord::Base

  def setup
    @sem3 = Semantics3::Products.new(Rails.application.secrets.sem3_api_key,
                                     Rails.application.secrets.sem3_api_secret)
  end

  def construct_query
    @sem3.products_field('search', query)
  end

  def get_products
    results || create_results
  end

  def create_results
    setup
    construct_query
    results = @sem3.get_products["results"]
    update(results: results)
    results
   end
end

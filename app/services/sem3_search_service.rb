require 'semantics3'

class Sem3SearchService
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def execute
    setup
    construct_query
    get_products
  end

  private

  def setup
    @sem3 = Semantics3::Products.new(Rails.application.secrets.sem3_api_key,
                                     Rails.application.secrets.sem3_api_secret)
  end

  def construct_query
    @sem3.products_field('search', params[:search])
  end

  def get_products
    @sem3.get_products
  end

  def store
    productsHash = get_products
    products_json = productsHash.to_json

    products = products_json['results'].map do |item|
      p = ProductSearch.new
      p.name = item['name']
      p.image_url = item['images'].map { |url| url }
      p.description = item['description']
      p.brand = item['brand']
      p.price = item['price']

      p.save
      p
    end
    products.select(&:persisted?)

  end
end

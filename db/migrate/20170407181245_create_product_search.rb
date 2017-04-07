class CreateProductSearch < ActiveRecord::Migration[5.1]
  def change
    create_table :product_searches do |t|
      t.string :query
      t.jsonb :results
    end
  end
end

# app/models/query_objects/products_query.rb
class ProductsQuery
  def initialize(relation)
    @relation = relation
  end

  def with_price_range
    @relation = @relation.order(:price)
    self
  end

  def order_by_name
    @relation = @relation.order(:name)
    self
  end

  def result
    @relation
  end
end
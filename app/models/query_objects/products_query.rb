# app/models/query_objects/products_query.rb
class ProductsQuery
  def initialize(relation)
    @relation = relation
  end

  def with_price_range
    @relation = @relation.order(:price)
  end

  def greater_than
    @relation = @relation.where("price >?", 50000)
  end

  def order_by_name
    @relation = @relation.order(:name)
  end
end
require_relative 'item'

class Author
  attr_accessor :first_name, :last_name, :items

  def initialize(first_name, last_name)
    Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
  end

  def add_item(item)
    item.author = self
    item << item
  end

  # def add_item(item)
  #   item.author = self
  #   @item << item
  # end
end

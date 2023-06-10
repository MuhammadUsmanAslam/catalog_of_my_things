require_relative 'item'

class Author
  attr_accessor :author_name

  def initialize(author_name)
    Random.rand(1..1000)
    @author_name = author_name
    @items = []
  end

  def add_item(item)
    item.author = self
    item << item
  end
end

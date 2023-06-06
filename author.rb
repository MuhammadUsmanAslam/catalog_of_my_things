require_relative './item'
class Author 
    def initialize(id,first_name,last_name,items)
        @id=id
        @first_name = first_name
        @last_name = last_name
        @items = items
    end
end

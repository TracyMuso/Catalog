require_relative 'item'

class Genre < Item
    attr_accessor :name
    attr_reader :items, :id
    
    def initialize(name)
        @name = name
        @items = []
        @id = Random.rand(1..1000)
    end

    def add_item(item)
        @items << item
        item.add_genre(self)
    end
end

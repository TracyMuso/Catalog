Class Source
def initialize(name)
    @name = name
    @items = []  
end
def add_item(item)
    @items << item
    item.add_source(self)
end

end
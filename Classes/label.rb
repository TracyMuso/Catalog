class Label
  attr_accessor :title, :color, :items
  attr_reader :id

  def initialize(title, color, id = Random.rand(1..1000))
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
    item.add_label = self
  end
end

require_relative 'item'
class Movie < Item
  attr_reader :name, :silet, :source, :publish_date

  def initialize(name, source, publish_date, silet)
    super(publish_date)
    @name = name
    @silet = silet
    @source = source
  end

  def can_be_archived?
    super && @silet
  end
end

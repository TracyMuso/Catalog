class Item
  attr_accessor :publish_date
  attr_reader :genre, :author, :source, :label

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @genre = nil
    @genre.items << self
    @author = nil
    @author.items << self
    @source = nil
    @source.items << self
    @label = nil
    @label.items << self
    @publish_date = publish_date
    @archived = false
  end

  def move_to_archive
    @archieved = true if can_be_archieved?
  end

  private

  def can_be_archived?
    year_pub = Time.parse(@publish_date).year
    current_date = Time.new.year
    current_date - year_pub > 10
  end
end

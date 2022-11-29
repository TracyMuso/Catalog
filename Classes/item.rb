class Item
  attr_reader :genre, :author, :source, :label, :publish_date

  def initialize (publish_date)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @source = source
    @label = nil
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

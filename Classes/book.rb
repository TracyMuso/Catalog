 require_relative 'item'
class Book < Item
    attr_accessor :publisher, :cover_state

    def initialize(publish_date, publisher, cover_state)
        super(publish_date)
        @publisher = publisher
        @cover_state = cover_state
    end
    private
    def can_be_archived?
     super || cover_state == 'bad'
    end
end

book1 = Book.new('2022-04-03', 'Joan', 'good')
puts book1.label


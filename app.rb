require_relative './Classes/item'
require_relative './Classes/book'
require_relative './Classes/label'
require_relative './Classes/verify_date'
class App
  def initialize
    @books = []
    @labels = []
  end

  def add_book
    puts 'Add a book'
    print 'Publish Date[dd/mm/yyyy]: '
    publish_date = gets.chomp
    publish_date = DateVerification.get_date(publish_date)
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover state Date["good" or "bad"]: '
    cover_state = gets.chomp.downcase
    new_book = Book.new(publish_date, publisher, cover_state)
    new_label = add_label
    new_label.add_book(new_book)
    @books << new_book
    @labels << new_label
    puts 'A book is added successfullly'
    puts ''
  end

  def add_label
    puts 'Add a label'
    print 'Title: '
    title = gets.chomp
    print 'Color: '
    color = gets.chomp
    Label.new(title, color)
  end

  def list_all_books
    if @books.empty?
      puts 'The catalog has no books'
    else
      puts 'List of all books:'
      @books.each_with_index do |book, index|
        puts "
        #{index + 1} Publish_date: #{book.publish_date},
        Publisher: #{book.publisher},
        Cover_state: #{book.cover_state}"
      end
    end
    puts ''
  end

  def list_all_labels
    if @labels.empty?
      puts 'The Catalog has no labels'
    else
      puts 'List of all labels:'
      @labels.each_with_index do |book, index|
        puts "[#{index + 1}] Title: #{book.title}, Color: #{book.color}"
      end
    end
    puts ''
  end
end

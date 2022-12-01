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
    def add_music_album
      puts 'Name of the music album: '
      name = gets.chomp
      puts 'Is it on Spotify? (y/n)'
      on_spotify = gets.chomp == 'y'
      puts 'Publish date: '
      publish_date = gets.chomp
      MusicAlbum.new(name, on_spotify, publish_date)
    end

    def list_all_albums
      MusicAlbum.all.each do |album|
        puts "Name: #{album.name}"
        puts "On Spotify: #{album.on_spotify}"
        puts "Publish date: #{album.publish_date}"
        puts "Genre: #{album.genre.name}"
        puts "Archived: #{album.archived}"
        puts '-' * 50
      end
    end

    def add_genre
      puts 'Name of the genre: '
      name = gets.chomp
      Genre.new(name)
    end

    def list_all_genres
      Genre.all.each do |genre|
        puts "Name: #{genre.name}"
        puts "Items: #{genre.items}"
        puts '-' * 50
      end
    end
  end
end

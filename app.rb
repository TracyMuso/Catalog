require_relative './Classes/item'
require_relative './Classes/book'
require_relative './Classes/label'
require_relative './Classes/verify_date'
require './Classes/game'
require './Classes/author'

class App
  def initialize
    @books = []
    @labels = []
    @games = []
    @authors = []
  end

  def process_option(option)
    case option
    when '1'
      list_books
    when '2'
      list_music_albums
    when '3'
      list_movies
    when '4'
      list_games
    when '5'
      list_genres
    when '6'
      list_labels
    when '7'
      list_authors
    when '8'
      list_sources
    when '9'
      add_book
    when '10'
      add_music_album
    when '11'
      add_movie
    when '12'
      add_game
    else
      puts 'That is not a valid input'
    end
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

  # function to add new game
  def add_game
    puts 'Enter publish date'
    publish_date = gets.chomp
    puts 'Enter multiplayer'
    multiplayer = gets.chomp
    puts 'Enter last player at'
    last_player_at = gets.chomp
    game = Game.new(publish_date, multiplayer, last_player_at)
    @games.push(game)
  end

  # function to list all games
  def list_games
    @games.map do |game|
      puts "ID: #{game.id}, Player: #{game.multiplayer}, Last Player: #{game.last_player_at}"
    end
  end

  # function to add new author
  def add_author
    puts 'Enter first name'
    first_name = gets.chomp
    puts 'Enter last name'
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @authors.push(author)
  end

  # function to list all authors
  def list_authors
    @authors.map do |author|
      puts "ID: #{author.id}, First Name: #{author.first_name}, Last Name: #{author.last_name}, Items: #{author.items}"
    end
  end

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

require_relative 'helper'

class App
  def initialize
    @books = []
    @labels = []
    @games = []
    @authors = []
    @movies = []
    @sources = []
  end

  def process_option(option)
    case option
    when '1'
      list_all_books
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

  # rubocop:enable Metrics/CyclomaticComplexity

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
        Title: #{book.label.title},
        Title: #{book.label.color},
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
      puts "ID: #{game.id},
      Player: #{game.multiplayer},
      Last Player: #{game.last_player_at}"
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
      puts "ID: #{author.id},
      First Name: #{author.first_name},
      Last Name: #{author.last_name},
      Items: #{author.items}"
    end
  end

  def add_music_album
    puts 'Name of the music album: '
    name = gets.chomp
    puts 'Is it on Spotify? (y/n)'
    on_spotify = gets.chomp == 'y'
    puts 'Publish date: '
    publish_date = gets.chomp
    new_album = MusicAlbum.new(name, on_spotify, publish_date)
    save_album(new_album)
  end

  def list_albums
    albums = File.size('./data/music_albums.json').zero? ? [] : JSON.parse(File.read('./data/music_albums.json'))
    albums.each do |album|
      puts "Name: #{album.name}"
      puts "On Spotify: #{album.on_spotify}"
      puts "Publish date: #{album.publish_date}"
      puts "Archived: #{album.archived}"
      puts '-' * 50
    end
  end

  def save_album(album)
    album_object = {
      name: album.name,
      on_spotify: album.on_spotify,
      publish_date: album.publish_date
    }

    stored_album = File.size('./data/music_albums.json').zero? ? [] : JSON.parse(File.read('./data/music_albums.json'))
    stored_album.push(album_object)
    File.write('./data/music_albums.json', JSON.pretty_generate(stored_album))
  end

  def add_genre
    puts 'Name of the genre: '
    name = gets.chomp
    new_genre = Genre.new(name)
    save_genre(new_genre)
  end

  def save_genre(genre)
    genre_object = {
      id: genre.id,
      name: genre.name
    }
    saved_genre = File.size('./data/genre.json').zero? ? [] : JSON.parse(File.read('./data/genre.json'))
    saved_genre.push(genre_object)
    File.write('./data/genre.json', JSON.pretty_generate(saved_genre))
  end

  def list_genres
    genres = File.size('./data/genre.json').zero? ? [] : JSON.parse(File.read('./data/genre.json'))
    genres.each do |genre|
      puts "Name: #{genre.name}"
      puts "Items: #{genre.items}"
      puts '-' * 50
    end
  end

  # add movie
  def add_movie
    puts 'Enter Movie Name:'
    movie_name = gets.chomp
    puts 'Enter Movie Source:'
    movie_source = gets.chomp
    puts 'Enter Movie Publish Date:'
    movie_publish_date = gets.chomp
    puts 'Enter Movie Silet (y/n ):'
    movie_silet = gets.chomp

    case movie_silet
    when 'y'
      @movies << Movie.new(movie_name, movie_source, movie_publish_date, true)

    when 'n'
      @movies << Movie.new(movie_name, movie_source, movie_publish_date, false)
    else
      puts 'That is not a valid input'
    end
  end

  # list movie
  def list_movies
    @movies.each do |movie|
      puts "Movie Name: #{movie.name}"
      puts "Movie Source: #{movie.source}"
      puts "Movie Publish Date: #{movie.publish_date}"
      puts "Movie Silet: #{movie.silet}"
    end
  end
end

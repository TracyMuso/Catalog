require_relative 'helper'

class App
  def initialize
    @books = []
    @labels = []
    @games = []
    @authors = []
    @sources = []
  end

  def process_option(option)
    case option
    when '1'
      list_all_books
    when '2'
      list_music_movies
    when '3'
      list_movies
    when '4'
      list_games
    when '5'
      list_genres
    when '6'
      list_all_labels
    when '7'
      list_authors
    when '8'
      list_sources
    when '9'
      add_book
    when '10'
      add_music_movie
    when '11'
      add_movie
    when '12'
      add_game
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
    @books << new_book
    save_book(new_book)
    @labels << new_label
    save_label(new_label)
    puts 'A book is added successfullly'
    puts ''
  end

  def save_book(book)
    book_object = {
      publish_date: book.publish_date,
      publisher: book.publisher,
      cover_state: book.cover_state
    }

    stored_book = File.size('./data_json/books.json').zero? ? [] : JSON.parse(File.read('./data_json/books.json'))
    stored_book.push(book_object)
    File.write('./data_json/books.json', JSON.pretty_generate(stored_book))
  end

  def add_label
    puts 'Add a label'
    print 'Title: '
    title = gets.chomp
    print 'Color: '
    color = gets.chomp
    Label.new(title, color)
  end

  def save_label(label)
    label_object = {
      title: label.title,
      color: label.color
    }
    saved_label = File.size('./data_json/labels.json').zero? ? [] : JSON.parse(File.read('./data_json/labels.json'))
    saved_label.push(label_object)
    File.write('./data_json/labels.json', JSON.pretty_generate(saved_label))
  end

  def list_all_books
    books = File.size('./data_json/books.json').zero? ? [] : JSON.parse(File.read('./data_json/books.json'))
    books.each_with_index do |book, index|
      puts "#{index + 1} publish_date: #{book['publish_date']}",
           "publisher: #{book['publisher']}",
           "cover_state: #{book['cover_state']}"
      puts '-' * 50
    end
  end

  def list_all_labels
    labels = File.size('./data_json/labels.json').zero? ? [] : JSON.parse(File.read('./data_json/labels.json'))
    labels.each_with_index do |label, index|
      puts "#{index + 1} Title: #{label['title']}", "color: #{label['color']}"
      puts '-' * 50
    end
  end

  # function to add new game
  def add_game
    puts 'Enter publish date'
    publish_date = gets.chomp
    puts 'Enter multiplayer'
    multiplayer = gets.chomp
    puts 'Enter last player'
    last_player_at = gets.chomp
    new_author = add_author
    game = Game.new(publish_date, multiplayer, last_player_at)
    @games.push(game)
    save_game(game)
    @authors.push(new_author)
    save_author(new_author)
  end

  def save_game(game)
    game_object = {
      publish_date: game.publish_date,
      multiplayer: game.multiplayer,
      last_player_at: game.last_player_at
    }

    stored_game = File.size('./data/game.json').zero? ? [] : JSON.parse(File.read('./data/game.json'))
    stored_game.push(game_object)
    File.write('./data/game.json', JSON.pretty_generate(stored_game))
  end

  # function to list all games
  def list_games
    games = File.size('./data/game.json').zero? ? [] : JSON.parse(File.read('./data/game.json'))
    games.each do |game|
      puts "publish_date: #{game['publish_date']}", "multiplayers: #{game['multiplayer']}",
           "last_player: #{game['last_player_at']}"
      puts '-' * 50
    end
  end

  # function to add new author
  def add_author
    puts 'Enter first name'
    first_name = gets.chomp
    puts 'Enter last name'
    last_name = gets.chomp
    Author.new(first_name, last_name)
  end

  def save_author(author)
    author_object = {
      first_name: author.first_name,
      last_name: author.last_name
    }

    stored_author = File.size('./data/author.json').zero? ? [] : JSON.parse(File.read('./data/author.json'))
    stored_author.push(author_object)
    File.write('./data/author.json', JSON.pretty_generate(stored_author))
  end

  # function to list all authors
  def list_authors
    authors = File.size('./data/author.json').zero? ? [] : JSON.parse(File.read('./data/author.json'))
    authors.each do |author|
      puts "
    First Name: #{author['first_name']}",
           "Last Name: #{author['last_name']}"
      puts '-' * 50
    end
  end

  def add_music_movie
    puts 'Name of the music movie: '
    name = gets.chomp
    puts 'Is it on Spotify? (y/n)'
    on_spotify = gets.chomp == 'y'
    puts 'Publish date: '
    publish_date = gets.chomp
    new_album = MusicAlbum.new(name, on_spotify, publish_date)
    new_genre = add_genre
    save_album(new_album)
    save_genre(new_genre)
  end

  def list_music_movies
    movies = File.size('./data/movie_data.json').zero? ? [] : JSON.parse(File.read('./data/movie_data.json'))
    movies.each do |movie|
      puts "Name: #{movie['name']}", "On Spotify: #{movie['on_spotify']}", "Publish date: #{movie['publish_date']}"
      puts '-' * 50
    end
  end

  def save_movie(movie)
    movie_object = {
      name: movie.name,
      on_spotify: movie.on_spotify,
      publish_date: movie.publish_date
    }

    stored_movie = File.size('./data/movie_data.json').zero? ? [] : JSON.parse(File.read('./data/movie_data.json'))
    stored_movie.push(movie_object)
    File.write('./data/movie_data.json', JSON.pretty_generate(stored_movie))
  end

  def add_genre
    puts 'Name of the genre: '
    name = gets.chomp
    Genre.new(name)
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
      puts "Name: #{genre['name']}", "Items: #{genre['items']}"
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
      new_movie = Movie.new(movie_name, movie_source, movie_publish_date, true)
    when 'n'
      new_movie = Movie.new(movie_name, movie_source, movie_publish_date, false)
    else
      puts 'That is not a valid input'
    end
    add_source(new_movie)
    store_movies(new_movie)
  end

  # list movie
  def list_movies
    movies = File.size('./data/movie_data.json').zero? ? [] : JSON.parse(File.read('./data/movie_data.json'))
    movies.each do |movie|
      puts "Name: #{movie['name']}", "Source: #{movie['source']}",
           "Publish date: #{movie['publish_date']}, Silet: #{movie['silet']}"
      puts '-' * 50
    end
  end

  # prserve data
  def store_movies(movies)
    movie_object = {
      name: movies.name,
      source: movies.source,
      publish_date: movies.publish_date,
      silet: movies.silet
    }

    stored_movie = File.size('./data/movie_data.json').zero? ? [] : JSON.parse(File.read('./data/movie_data.json'))
    stored_movie.push(movie_object)
    File.write('./data/movie_data.json', JSON.pretty_generate(stored_movie))
    puts 'in store movies'
  end

  # add source
  def add_source(item)
    puts 'Enter Source Name:'
    source_name = gets.chomp
    new_source = Source.new(source_name)
    puts 'now going to source.rb'
    new_source.add_item(item)
    puts 'source created successfully'
    store_source(new_source)
  end

  # store source to json file
  def store_source(new_source)
    hash = {
      id: new_source.id,
      name: new_source.name
    }

    if File.exist?('./data/source.json')
      file = File.size('./data/source.json').zero? ? [] : JSON.parse(File.read('./data/source.json'))
      file << hash
      File.write('./data/source.json', file.to_json)
    else
      File.write('./data/source.json', [])
    end
  end

  # list source
  def list_sources
    sources = File.size('./data/source.json').zero? ? [] : JSON.parse(File.read('./data/source.json'))
    sources.each do |a|
      puts "id: #{a['id']} , Name: #{a['name']}"
    end
  end
end

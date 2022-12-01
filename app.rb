require './Classes/game'
require './Classes/author'
require_relative './Classes/movie'
require_relative './Classes/source'

class App
  def initialize
    @games = []
    @authors = []
    @movies = []
    @sources = []
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

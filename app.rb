require_relative '../Classes/movie'
require_relative '../Classes/source'

class App
  attr_accessor :movies
  def initialize
    @movies = []
    @sources = []
  end

  def add_movie(movie)
    puts 'Enter Movie Name:'
    movie_name = gets.chomp
    puts 'Enter Movie Source:'
    movie_source = gets.chomp
    puts 'Enter Movie Publish Date:'
    movie_publish_date = gets.chomp
    puts 'Enter Movie Silet:'
    movie_silet = gets.chomp
    @movies << movie.new(movie_name, movie_source, movie_publish_date, movie_silet)
  end
  def list_movies(movies)
    movies.each do |movie|
      puts "Movie Name: #{movie.name}"
      puts "Movie Source: #{movie.source}"
      puts "Movie Publish Date: #{movie.publish_date}"
      puts "Movie Silet: #{movie.silet}"
    end
  
    
end

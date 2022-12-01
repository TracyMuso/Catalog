require_relative '../Classes/movie'

class App
  attr_accessor :movies
  def initialize
    @movies = []
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
    @movies << movie
  end
  puts 'hello'
end

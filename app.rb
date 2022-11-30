require './Classes/game'
require './Classes/author'
class App
  def initialize
    @games = []
    @authors = []
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

end

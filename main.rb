class Main
  loop do
    puts '-' * 50
    puts "|\tWelcome to my Catalog of things!!\t\t |"
    puts '-' * 50
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all movies'
    puts '4 - List all games'
    puts '5 List all genres'
    puts '6 List all labels'
    puts '7 List all authors'
    puts '8 List all sources'
    puts '9 Add a book'
    puts '10 Add a music album'
    puts '11 Add a movie'
    puts '12 Add a game'
    puts '13 - Exit'
    puts 'Please choose an option by entering a number:'
    option = gets.chomp
    option == '13' ? break : puts('Invalid option')
  end
end

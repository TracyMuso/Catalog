class App

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

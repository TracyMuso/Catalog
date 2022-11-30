require_relative 'item'

class MusicAlbum < Item
  attr_accessor :name, :on_spotify

  def initialize(name, on_spotify, publish_date)
    super(publish_date)
    @name = name
    @on_spotify = on_spotify
    @publish_date = publish_date
  end

  def can_be_archived?
    super && @on_spotify
  end
end

# ruby Classes/music_album.rb
# ruby Classes/genre.rb

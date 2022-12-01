require_relative './item'

class Game < Item
  attr_accessor :multiplayer, :last_player_at

  def initialize(publish_date, multiplayer, last_player_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_player_at = last_player_at
  end

  private

  def can_be_archieved?
    last = Time.parse(@last_player_at).year
    now = Time.new.year
    now - last > 2 && super.can_be_archieved?
  end
end

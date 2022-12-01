require_relative '../Classes/game'
require_relative '../Classes/item'

# Unit test class Game all methods
describe Game do
  context 'Unit Test Game Class' do
    game = Game.new '2022-11-25', false, '2022-11-30'
    it 'Should return Game publish Date' do
      expect(game.publish_date).to eq('2022-11-25')
    end

    it 'Should return game multiplayer' do
      expect(game.multiplayer).to be false
    end

    it 'Should be an instance of Game' do
      expect(game).to be_an_instance_of(Game)
    end
  end
end

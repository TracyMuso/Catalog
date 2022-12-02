require_relative '../Classes/source'
require_relative '../Classes/item'
require_relative '../Classes/movie'

describe Source do
  before(:each) do
    @source = Source.new('DVD')
  end

  it 'should be an instance of Source' do
    expect(@source).to be_an_instance_of(Source)
  end

  it 'should have a name' do
    expect(@source.name).to eq('DVD')
  end

  it 'Its name should be DVD' do
    expect(@source.name).to eq('DVD')
  end

  it 'should have items' do
    expect(@source.items).to eq([])
  end

  context 'testing methods' do
    it 'should work' do
      @movie = Movie.new('The Godfather', 'DVD', '1972-03-24', true)
      @source.add_item(@movie)
      expect(@source.items).to eq([@movie])
    end
  end
end

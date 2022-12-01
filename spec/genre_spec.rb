require './Classes/genre'
require './Classes/item'

describe Genre do
  let(:genre) { Genre.new('Rock') }

  it 'has a name' do
    expect(genre.name).to eq('Rock')
  end

  it 'Initialize instance of the Label Class' do
    expect(genre).to be_instance_of Genre
  end

  it 'has items' do
    expect(genre.items).to eq([])
  end

  it 'can add items' do
    item = Item.new('2019-01-01')
    genre.add_item(item)
    expect(genre.items).to eq([item])
  end
end

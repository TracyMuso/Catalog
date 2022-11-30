require './Classes/music_album'

describe MusicAlbum do
  let(:music_album) { MusicAlbum.new('The Dark Side of the Moon', true, '1973-03-01') }

  it 'has a name' do
    expect(music_album.name).to eq('The Dark Side of the Moon')
  end

  it 'has a publish date' do
    expect(music_album.publish_date).to eq('1973-03-01')
  end

  it 'has a genre' do
    expect(music_album.genre).to eq(nil)
  end

  it 'has an archived status' do
    expect(music_album.archived).to eq(false)
  end

  it 'can be archived' do
    expect(music_album.can_be_archived?).to eq(true)
  end

  context 'Instance of Genre could be created:' do
    test_genre = Genre.new('Alternative Rock')
    it 'Should be an instance of Genre' do
      expect(test_genre).to be_an_instance_of Genre
    end
  end

  it 'is found on spotify' do
    expect(music_album.on_spotify).to eq(true)
  end
end

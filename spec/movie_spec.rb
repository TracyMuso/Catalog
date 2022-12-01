require_relative '../Classes/movie.rb'

describe Movie do
    before(:each) do
        @movie = Movie.new('Sholey', 'DVD', Date.new(2019, 1, 1), true)
    end

    it 'should be an instance of Movie' do
        expect(@movie).to be_an_instance_of(Movie)
    end

    it 'should have a name' do
        expect(@movie.name).to eq('Sholey')
    end

    it 'should have a source' do
        expect(@movie.source).to eq('DVD')
    end

    it 'Its source should be DVD' do
        expect(@movie.source).to eq('DVD')
    end

    end
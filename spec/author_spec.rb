require_relative '../Classes/author'

# Test author function
describe Author do
  context 'Unit Test Author Class' do
    author = Author.new 'John', 'Doe'
    it 'Should return Author first name' do
      expect(author.first_name).to eq('John')
    end

    it 'Should return Author last name' do
      expect(author.last_name).to eq('Doe')
    end

    it 'Should be an instance of Author' do
      expect(author).to be_an_instance_of(Author)
    end
  end
end

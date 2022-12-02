require_relative '../Classes/book'
require 'rspec/autorun'

describe Book do
  context 'When testing Book class' do
    it 'Should create a book' do
      book = Book.new('02/05/2022', 'publisher', 'cover_state')
      expect(book.publish_date).to eq('02/05/2022')
      expect(book.publisher).to eq('publisher')
      expect(book.cover_state).to eq('cover_state')
    end
  end
   before(:each) do
    @book = Book.new('publish_date', 'publisher', 'cover_state')
  end

  it 'should be the instance object of Book class' do
    expect(@book).to be_an_instance_of(Book)
  end

  it 'Should return publisher' do
    expect(@book.publisher).to eq 'publisher'
  end
end
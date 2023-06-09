require 'rspec'
require_relative '../book'

RSpec.describe Book do
  describe '#can_be_archived?' do
    let(:publish_date) { '2010, 1, 1' }
    let(:book) { Book.new('Publisher', 'good', 'Genre', 'Author', 'Source', 'Label', publish_date, false) }

    context 'when the book is older than 10 years' do
      it 'returns true' do
        allow(Date).to receive(:today).and_return(Date.new(2013, 1, 1))
        expect(book.can_be_archived?).to be(false)
      end
    end

    context 'when the book is not older than 10 years' do
      it 'returns false' do
        allow(Date).to receive(:today).and_return(Date.new(2022, 1, 1))
        expect(book.can_be_archived?).to be(false)
      end
    end

    context 'when the cover state is bad' do
      let(:book) { Book.new('Publisher', 'bad', 'Genre', 'Author', 'Source', 'Label', publish_date, false) }

      it 'returns true' do
        allow(Date).to receive(:today).and_return(Date.new(2022, 1, 1))
        expect(book.can_be_archived?).to be(true)
      end
    end

    context 'when the book is not older than 10 years and the cover state is good' do
      let(:book) { Book.new('Publisher', 'good', 'Genre', 'Author', 'Source', 'Label', publish_date, false) }

      it 'returns false' do
        allow(Date).to receive(:today).and_return(Date.new(2022, 1, 1))
        expect(book.can_be_archived?).to be(false)
      end
    end
  end
end
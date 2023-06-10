require 'rspec'
require_relative '../book'

RSpec.describe Book do
  let(:publisher) { 'Example Publisher' }
  let(:cover_state) { 'good' }
  let(:author) { 'John Doe' }
  let(:label) { 'Example Book' }
  let(:publish_date) { Date.new(2020, 1, 1) }
  let(:archived) { false }

  subject(:book) { described_class.new(publisher, cover_state, author, label, publish_date, archived) }

  describe '#initialize' do
    it 'sets the attributes correctly' do
      expect(book.publisher).to eq(publisher)
      expect(book.cover_state).to eq(cover_state)
      expect(book.author).to eq(author)
      expect(book.label).to eq(label)
      expect(book.publish_date).to eq(publish_date)
      expect(book.archived).to eq(archived)
    end

    it 'generates a random ID' do
      expect(book.id).to be_a(Integer)
    end
  end

  describe '#can_be_archived?' do
    context 'when the cover state is good and less than 10 years have passed' do
      let(:cover_state) { 'good' }
      let(:publish_date) { Date.today - 9 * 365 }

      it 'returns false' do
        expect(book.can_be_archived?).to be_falsey
      end
    end

    context 'when the cover state is good and more than 10 years have passed' do
      let(:cover_state) { 'good' }
      let(:publish_date) { Date.today - 11 * 365 }

      it 'returns false' do
        expect(book.can_be_archived?).to be_falsey
      end
    end

    context 'when the cover state is bad' do
      let(:cover_state) { 'bad' }

      it 'returns true' do
        expect(book.can_be_archived?).to be_truthy
      end
    end
  end
end
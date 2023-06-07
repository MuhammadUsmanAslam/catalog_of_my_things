require 'rspec'
require_relative './game'
require_relative './author'

RSpec.describe 'Game' do
  describe '#can_be_archived?' do
    it 'returns true if parents_results && last_played_duration else false' do
      multiplayer = true
      last_played_at = '2021-06-01'
      publish_date = '2020-01-01' # Replace with a valid publish_date

      results = Game.new(nil, nil, nil, nil, nil, publish_date, nil, multiplayer, last_played_at)
      final = results.can_be_archived?
      expect(final).to eql(false)
    end
  end
end

require_relative './item.rb'
require 'date'

class Game < Item
    attr_reader :last_played_at

    def initialize(id, genre, author, source, label, publish_date, archived, multiplayer,last_played_at)
        super(id, genre, author, source, label, publish_date, archived)
        @multiplayer = multiplayer
        @last_played_at = Date.parse(last_played_at)
        @id = id
    end

    def can_be_archived?
        parents_results = super
        last_played_duration = @last_played_at < (Date.today - 365 * 2)
    
        if parents_results && last_played_duration
          true
        else
          false
        end
      end
end

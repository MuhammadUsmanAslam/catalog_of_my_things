require_relative 'item.rb'
require 'date'

class Game 
    attr_reader :last_played_at

    def initialize(multiplayer,last_played_at)
        super(id, genre, author, source, label, publish_date, archived)
        @multiplayer = multiplayer
        @last_played_at = Date.parse(last_played_at)
    end

    def can_be_archived?()
        parents_results = super
        last_name_played_duration= @last_played_at <(Date.today - 365*2)
        if parents_results ===true && last_name_played_duration < 2years?
            true
        else
            false
        end
    end
end

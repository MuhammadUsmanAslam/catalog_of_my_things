require_relative './item.rb'
require 'date'

class Game < Item
    attr_accessor :multiplayer, :last_played_at

    def initialize(id,title, author, genre, label, multiplayer, last_played_at)
      super(id, genre, author, source, label, publish_date, archived)
      @multiplayer = multiplayer
      @last_played_at = last_played_at
      @id=id
      @title=title
    end
    def title
        @title
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

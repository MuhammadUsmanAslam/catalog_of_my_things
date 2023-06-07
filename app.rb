require_relative './author.rb'
require_relative './game.rb'
require_relative './item.rb'

class App
    def initialize
        @game = []
    end
    def list_games
        @game.each do |game|
          puts game.title
        end
      end
      def list_authors
        authors = @game.map(&:author).uniq
        authors.each do |author|
          puts author
        end
      end

      def add_game
        @game << game
      end


end
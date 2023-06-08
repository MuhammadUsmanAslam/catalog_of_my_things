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

      def save_data(file_name)
        File.open(file_name, 'w') do |file|
          file.write(JSON.generate(@game))
        end
      end
    
      def load_data(file_name)
        if File.exist?(file_name)
          file_contents = File.read(file_name)
          @game = JSON.parse(file_contents)
        else
          puts "File '#{file_name}' not found."
        end
      end


end
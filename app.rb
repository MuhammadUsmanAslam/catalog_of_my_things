require_relative './author.rb'
require_relative './game.rb'
require 'json'

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
      def add_game(title, author, multiplayer, last_played_at, genre, label, id)
        game = Game.new(id, genre, author, nil, label, nil, false, multiplayer, last_played_at, title)
        @game << game
        puts "Game '#{game.title}' added successfully!"
      end

      def save_data(file_name)
        File.open(file_name, 'w') do |file|
          file.write(JSON.generate(@game))
        end
      end
      
      def load_data(filename)
        if File.exist?(filename)
          json_data = File.read(filename)
          @game = JSON.parse(json_data)
        else
          @game = []
          save_data(filename)
        end
      end
      
      


end
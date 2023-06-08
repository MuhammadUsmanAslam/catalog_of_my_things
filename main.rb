require_relative './app.rb'

def run_option
  puts 'Welcome to our App console!'
  puts 'Kindly choose an option'
  puts '1-:List all books'
  puts '2-:List all music albums'
  puts '3-:List of games'
  puts '4-:List all genres '
  puts '5-:List all labels '
  puts '6-:List all authors '
  puts '7-:List all sources '
  puts '8-:Add a book'
  puts '9-:Add a music album'
  puts '10-:Add a game'
  puts '11-: Exit/Quit'
end

def add_game(app)
    puts 'Enter game title:'
    title = gets.chomp
    puts 'Enter game author:'
    author = gets.chomp
    puts 'Enter multiplayer (true/false):'
    multiplayer = gets.chomp.downcase == 'true'
    puts 'Enter last played at:'
    last_played_at = gets.chomp
    puts 'genre of game'
    genre=gets.chomp
    puts 'label of game'
    label=gets.chomp
    puts 'id of player'
    id=gets.chomp
    
    game = Game.new(id,title, author, genre, label, multiplayer, last_played_at)
    app.add_game(game)
    
    puts "Game '#{game.title}' added successfully!"
  end

def handle_option(option, app) # rubocop:disable Metrics/CyclomaticComplexity
  case option
  when 1
    puts 'List all books'
  when 2
    puts 'List all music albums'
   when 3
    app.list_games
  when 4
    app.list_authors
  when 5
    puts 'List all labels'
  when 6
    app.list_authors
  when 7
    puts 'List all sources '
  when 8
    puts 'Add a book'
  when 9
    puts 'Add a music album'
  when 10
    add_game(app)
  when 11
    puts 'Thanks You!!...'
    false
  end
end

def main
  status = true
  app = App.new
  app.load_data('./game.json') 
  while status
    run_option
    option = gets.chomp.to_i
    handle_option(option, app)
    status = false if option == 11
  end
end

main

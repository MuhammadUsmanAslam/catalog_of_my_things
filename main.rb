<<<<<<< HEAD
require_relative 'musicAlbum/music_album_ui'
=======
require_relative './app.rb'
>>>>>>> 8c90eca (Add options)

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

def handle_option(option, music_album_ui) # rubocop:disable Metrics/CyclomaticComplexity
def add_game(app)
    puts 'add multiplayer'
    multiplayer= gets.chomp
    puts 'add last_played_at '
    last_played_at= gets.chomp
end

def handle_option(option, app) # rubocop:disable Metrics/CyclomaticComplexity
  case option
  when 1
    puts 'List all books'
  when 2
    music_album_ui.list_music_album
  when 3
    puts 'List of games'
  when 4
    music_album_ui.list_genre
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
    music_album_ui.add_music_album
  when 10
    add_game(app)
  when 11
    puts 'Thanks You!!...'
    false
  end
end

def main
  music_album_ui = MusicAlbumUI.new
  status = true
  app=App.new
  while status
    run_option
    option = gets.chomp.to_i
    handle_option(option, app)
    status = false if option == 11
  end
end

main

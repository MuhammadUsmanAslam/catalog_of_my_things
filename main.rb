require_relative 'musicAlbum/music_album_ui'
require_relative 'app'

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

def handle_option(option, music_album_ui, app) # rubocop:disable Metrics/CyclomaticComplexity
  case option
  when 1
    app.list_books
  when 2
    music_album_ui.list_music_album
  when 3
    puts 'List of games'
  when 4
    music_album_ui.list_genre
  when 5
    app.list_labels
  when 6
    puts 'List all authors'
  when 7
    puts 'List all sources '
  when 8
    app.add_book
  when 9
    music_album_ui.add_music_album
  when 10
    puts 'Add a game'
  when 11
    puts 'Thanks You!!...'
    app.save_books
    false
  end
end

def main
  music_album_ui = MusicAlbumUI.new
  app = App.new
  app.load_books
  status = true
  while status
    run_option
    option = gets.chomp.to_i
    status = handle_option(option, music_album_ui, app)
    status = false if option == 11
  end
end

main

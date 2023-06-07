require_relative 'music_album'
require_relative 'genre'
require_relative 'music_album_store'

class MusicAlbumUI
  attr_reader :music_album_store, :music_album, :genre

  def initialize
    @music_album_store = MusicAlbumStore.new
    @music_album = []
    @genre = []
    load_music_album
  end

  def list_music_album
    if @music_album.empty?
      puts 'Music Album is empty.'
    else
      @music_album.each_with_index do |album, index|
        spotify = 'Unavailable'
        spotify = 'Available' if album.on_spotify
        puts "#{index})publish date:- #{album.publish_date} spotify:- #{spotify} genre:- #{album.genre.name}"
      end
    end
  end

  def list_genre
    if @genre.empty?
      puts 'Genre is empty.'
    else
      @genre.each_with_index do |genre, index|
        puts "#{index}) genre:- #{genre.name}"
      end
    end
  end

  def create_genre(name)
    genre = Genre.new(name)
    @genre << genre
    genre
  end

  def create_music_album(publish_date, spotify, genre)
    new_music_album = MusicAlbum.new(publish_date, on_spotify: spotify)
    new_music_album.genre = genre
    @music_album << new_music_album
  end

  def add_genre
    puts 'Genre name:-'
    name = gets.chomp
    create_genre(name)
  end

  def add_music_album
    puts 'Publish date:-'
    publish_date = gets.chomp
    puts 'Available on spotify (y/n):-'
    spotify = false
    spotify = true unless %w[n N no No].include?(gets.chomp)
    puts 'Select music album genre:-'
    puts '0) Create new genere.'
    @genre.each_with_index do |genre, index|
      puts "#{index + 1}) #{genre.name}"
    end
    option = gets.chomp.to_i
    genre = option.zero? ? add_genre : @genre[option - 1]

    if genre
      create_music_album(publish_date, spotify, genre)
      @music_album_store.store_music_album({ publish_date: publish_date, on_spotify: spotify,
                                             genre: genre.name })
      puts 'Music Album Created'
    else
      puts 'Invalid option'
    end
  end

  def load_music_album
    if File.exist?(@music_album_store.music_album_file)
      music_albums = music_album_store.file_read(@music_album_store.music_album_file)
    end
    return unless music_albums

    music_albums.each do |album|
      genre = @genre.find { |obj| obj.name == album['genre'] }
      genre ||= create_genre(album['genre'])
      create_music_album(album['publish_date'], album['on_spotify'], genre)
    end
  end
end
require 'json'

class MusicAlbumStore
  attr_reader :music_album_file

  def initialize
    @music_album_file = 'musicAlbum/music_album.json'
  end

  def file_read(filename)
    file = File.read(filename)
    JSON.parse(file)
  end

  def file_write(filename, data)
    File.write(filename, JSON.generate(data))
  end

  def store_music_album(music_album)
    music_albums = []
    music_albums = file_read(@music_album_file) if File.exist?(@music_album_file)
    music_albums << music_album
    file_write(@music_album_file, music_albums)
  end
end

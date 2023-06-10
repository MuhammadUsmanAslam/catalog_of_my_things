require_relative '../item'

class MusicAlbum < Item
  attr_accessor :on_spotify
  attr_reader :genre

  def initialize(publish_date, on_spotify: false)
    super(publish_date)
    @on_spotify = on_spotify
  end

  attr_writer :genre

  private

  def can_be_archived?
    return true if super && @on_spotify

    false
  end
end

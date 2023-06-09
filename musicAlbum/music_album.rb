require_relative '../item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify: false)
    super(nil, nil, nil, nil, nil, publish_date, false)
    @on_spotify = on_spotify
  end

  attr_writer :genre

  private

  def can_be_archived?
    return true if super && @on_spotify

    false
  end
end

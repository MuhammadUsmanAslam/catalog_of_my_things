require_relative 'music_album'

describe MusicAlbum do
  before :each do
    @music_album = MusicAlbum.new('2020-02-02', on_spotify: true)
  end

  it 'Test for MusicAlbum instance' do
    expect(@music_album).to be_instance_of MusicAlbum
  end

  it 'Test for can be archive method' do
    expect(@music_album.send('can_be_archived?')).to be false
  end
end
require_relative 'music_album'

describe MusicAlbum do
  before :each do
    @music_album = MusicAlbum.new('2020-02-02', on_spotify: true)
  end

  it 'Test for MusicAlbum instance' do
    expect(@music_album).to be_instance_of MusicAlbum
  end

  it 'Test for on_spotify attribute' do
    expect(@music_album.on_spotify).to be true
  end

  it 'Test for genre attribute' do
    expect(@music_album.genre).to be_nil
    @music_album.genre = 'Rock'
    expect(@music_album.genre).to eq('Rock')
  end
end

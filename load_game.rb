module LoadGame
  def load_game
    games = []

    return games unless File.exist?('./data/games.json')

    file = File.open('./data/game.json')
    data = JSON.parse(file.read)
    data.each do |game|
      games << Game.new(game['multiplayer'], game['last_played_at'], game['publish_date'])
    end
    File.close
    games
  end
end

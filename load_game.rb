module LoadGame
  def load_game
    games = []

    return games unless File.exist?('./data/game.json')

    file = File.open('./data/game.json')
    data = JSON.parse(file.read)
    data.each do |game|
      games << Game.new(game['multiplayer'], game['last_played_at'], game['publish_date'])
    end
    file.close
    games
  end

  def load_author
    authors = []

    return authors unless File.exist?('./data/author.json')

    file = File.open('./data/author.json')
    data = JSON.parse(file.read)
    data.each do |author|
      authors << Author.new(author['first_name'], author['last_name'])
    end
    file.close
    authors
  end
end

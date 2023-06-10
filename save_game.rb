module SaveGame
  def file_exist(filename)
    FileUtils.mkdir_p('./data')
    FileUtils.touch('./data/game.json') if !File.exist?('./data/game.json') && filename == 'game'
    FileUtils.touch('./data/author.json') if !File.exist?('./data/author.json') && filename == 'author'
  end

  def save_game(games)
    game_arr = []
    # binding pry
    games.each do |game|
      game_arr << {
        multiplayer: game.multiplayer,
        last_played_at: game.last_played_at,
        publish_date: game.publish_date
      }
    end
    # binding pry
    return if game_arr.empty?

    file_exist('game')
    File.write('./data/game.json', JSON.pretty_generate(game_arr))
  end 

  def save_author(authors)
    author_arr = []
    authors.each do |author|
      author_arr << {
        first_name: author.first_name,
        last_name: author.last_name
      }
    end
    return if author_arr.empty?

    file_exist('author')
    File.write('./data/author.json', JSON.pretty_generate(author_arr))
  end
end

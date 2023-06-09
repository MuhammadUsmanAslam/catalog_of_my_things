module SaveGame 
    def file_exist(filename)
        FileUtils.mkdir_p('./data')
        FileUtils.touch('./data/game.json') if !File.exist?('./data/game.json') && filename ==  'game'
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
end
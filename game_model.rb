module GameModel
  def add_game
    puts 'Is the game multiplayer? [Y/N]: '
    multiplayer = gets.chomp.downcase == 'y'
    puts 'Enter date of last played (yyyy-mm-dd): '
    last_played_at = gets.chomp
    puts 'Enter publish date (yyyy-mm-dd):'
    publish_date = gets.chomp
    puts 'Enter author author_name: '
    author_name = gets.chomp

    game = Game.new(multiplayer, last_played_at, publish_date)
    @games ||= []
    @games << game
    save_game(@games)
    author = Author.new(author_name)
    @authors << author
    save_author(@authors)

    puts 'Game  and Auhtor added successfully!'
  end

  def list_games
    load_game
    if @games.empty?
      puts 'No games found.'
    else
      @games.each do |game|
        puts "Multiplayer: #{game.multiplayer} | Last played: #{game.last_played_at} | Published: #{game.publish_date}"
      end
    end
  end

  def list_authors
    load_author
    if @authors.empty?
      puts 'No author found.'
    else
      @authors.each do |author|
        puts "Author Name: #{author.author_name} "
      end
    end
  end
end

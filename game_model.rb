module GameModel
  def add_game
    puts 'Is the game multiplayer? [Y/N]: '
    multiplayer = gets.chomp.downcase == 'y'
    puts 'Enter date of last played (yyyy-mm-dd): '
    last_played_at = gets.chomp
    puts 'Enter publish date (yyyy-mm-dd):'
    publish_date = gets.chomp
    puts 'Enter author first name: '
    first_name = gets.chomp
    puts 'Enter author last name: '
    last_name = gets.chomp

    game = Game.new(multiplayer, last_played_at, publish_date)
    @games ||= []
    @games << game
    save_game(@games)

    author = Author.new(first_name, last_name)
    author.add_author(game)

    @author_list ||= []
    @author_list << author

    puts 'Game added successfully!'
  end

  def list_authors
    if @author_list && !@author_list.empty?
      puts "\nAuthor List:\n"
      @author_list.each do |author|
        puts "Author name: #{author.name}"
      end
    else
      puts "\nThere are no authors in the list\n"
    end
    puts
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
end

module GameModel
  def add_game
    puts 'Is game multiplayer [Y/N]: '
    multiplayer = gets.chomp.downcase == 'true'
    puts 'Enter date of last played(yyyy-mm-dd): '
    last_played_at = gets.chomp
    puts 'Enter publish date (yyyy-mm-ddd):'
    publish_date = gets.chomp
    puts 'Enter first name: '
    first_name = gets.chomp
    puts 'Enter last name: '
    last_name = gets.chomp

    game = Game.new(multiplayer, last_played_at, publish_date)
    @games << game
    # binding pry
    save_game(@games)
    author = Author.new(first_name, last_name) 
    @authors << author
    save_author(@authors)

    puts 'Game  and Auhtor added successfully!'
  end

  def list_authors
    authors = []
    @games.each do |game|
      authors << game.author unless game.author.nil?
    end

    if authors.empty?
      puts 'author: kushie tracy'
    else
      authors.uniq.each do |author|
        puts "First_Name: #{author.first_name} | Last_Name: #{author.last_name}"
      end
    end
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
      puts 'No games found.'
    else
      @authors.each do |author|
        puts "First Name: #{author.first_name} | Last Name: #{author.last_name} "
      end
    end
  end
end

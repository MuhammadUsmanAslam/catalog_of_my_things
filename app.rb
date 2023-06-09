require 'json'
require 'fileutils'
require 'pry'

require_relative 'author'
require_relative 'game'
require_relative 'game_model'
require_relative 'save_game'
require_relative 'load_game'

class App
  def initialize
    @games = load_game
  end

  include GameModel
  include SaveGame
  include LoadGame
end

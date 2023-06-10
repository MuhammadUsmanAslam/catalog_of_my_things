require 'date'
require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    Random.rand(1..1000)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  # def can_be_archived?
  #   super && @last_played_at < 2.years.ago
  # end
  def can_be_archived?
    today = Date.today
    last_played_duration = (today - last_played_at).to_i
    publish_years_ago = (today.year - publish_date.year)

    multiplayer && last_played_duration >= 2 && publish_years_ago >= 2
  end
end

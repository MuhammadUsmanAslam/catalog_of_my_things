require_relative './item'

class Book < Item
  attr_accessor :publisher, :cover_state, :id

  def initialize(publisher, cover_state, _genre, _author, _source, _label, publish_date, _archived)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
    @id = rand(1..1000)
  end

  def can_be_archived?
    days = @publish_date - DateTime.now
    years = days / 365
    return true if years > 10 || @cover_state == 'bad'

    false
  end
end

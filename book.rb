require_relative './item'

class Book < Item
  attr_accessor :publisher, :cover_state, :id, :author, :label, :publish_date, :archived

  def initialize(publisher, cover_state, label, author, publish_date, archived)
    super(publish_date)
    @publisher = publisher
    @label = label
    @author = author
    @cover_state = cover_state
    @archived = archived
    @id = rand(1..1000)
  end

  def can_be_archived?
    days = @publish_date - DateTime.now
    years = days / 365
    return true if years > 10 || @cover_state == 'bad'

    false
  end
end

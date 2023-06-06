require_relative './item'

class Book < Item
  def initialize(publisher, cover_state, id, genre, author, source, label, publish_date, archived)
    super(id, genre, author, source, label, publish_date, archived)
    @publisher = publisher
    @cover_state = cover_state
    @id = id
    @genre = genre
    @author = author
    @source = source
    @label = label
    # publish date formate is YYYY, MM, DD
    @publish_date = Date.new(publish_date)
    @archived = archived
  end

  def can_be_archived?
    days = @publish_date - DateTime.now
    years = days / 365
    return true if years > 10 && @cover_state == 'bad'

    false
  end
end

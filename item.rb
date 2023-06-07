require 'date'

class Item
  def initialize(id, genre, author, source, label, publish_date, archived)
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
    return true if years > 10

    false
  end

  def move_to_archive
    return @archived = true if can_be_archived?

    false
  end
end

require 'date'

class Item
  attr_reader :id, :genre, :author, :source, :label, :publish_date, :archived

  initialize(id, genre, author, source, label, publish_date, archived)
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
    days = (Date.today - @publish_date).to_i
    years = days / 365
    years > 10
  end

  def move_to_archive
    if can_be_archived?
      @archived = true
      true
    else
      false
    end
  end
end

require 'date'

class Item
  attr_accessor :publish_date, :archived
  attr_reader :author

  def initialize(publish_date)
    Random.rand(1..1000)
    @publish_date = publish_date
    archived
  end

  def move_to_archive
    if can_be_archived?
      @archived = true
      true
    else
      false
    end
  end

  def authors=(author)
    @author = author
    author.items.push(self) unless author.items.include(self)
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include(self)
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include(self)
  end

  private

  def can_be_archived?
    days = (Date.today - @publish_date).to_i
    days / 365
  end
end

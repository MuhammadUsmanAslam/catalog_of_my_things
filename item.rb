require 'date'

class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date, :archived

  def initialize(id, genre, author, source, label, publish_date, archived)
    @id = id
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = Date.new(*publish_date.split(',').map(&:to_i)) unless publish_date.nil?
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

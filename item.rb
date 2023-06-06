require 'date'

class Item
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
        days = @publish_date - DateTime.now
        years = days / 365
        if years > 10
            return true
        end
        return false
    end

    def move_to_archive
        if can_be_archived?
            return @archived = true
        end
        return false
    end

end
require 'json'
require 'fileutils'

require_relative 'author'
require_relative 'game'
require_relative 'game_model'
require_relative 'save_game'
require_relative 'load_game'
require_relative './book'
require_relative './label'
require_relative './musicAlbum/music_album_ui'
require 'JSON'

class App
  def initialize
    @games = load_game
    @books = []
    @music = MusicAlbumUI.new
    @labels = []
    @authors = load_author
  end

  include GameModel
  include SaveGame
  include LoadGame

  def load_books
    return unless File.exist?('books.json')

    books_data = JSON.parse(File.read('books.json'))
    books_data.each do |book|
      book_obj = Book.new(book['publisher'], book['cover_state'], book['author_name'],
                          book['label'], book['publish_date'], book['archived'])
      @books.push(book_obj)
    end
  end

  def load_labels
    return unless File.exist?('labels.json')

    labels_data = JSON.parse(File.read('labels.json'))
    labels_data.each do |label|
      label_obj = Label.new(label['title'], label['color'])
      @labels.push(label_obj)
    end
  end

  def list_books
    return unless @books.length.positive?

    @books.each { |book| puts "Label: #{book.label} Publish Date: #{book.publish_date}\n" }
  end

  def save_books
    books_to_add = []
    @books.each do |book|
      books_to_add << {
        id: book.id,
        publisher: book.publisher,
        cover_state: book.cover_state,
        author: book.author,
        label: book.label,
        publish_date: book.publish_date,
        archived: book.archived
      }
    end

    File.write('books.json', JSON.pretty_generate(books_to_add))
  end

  def save_labels
    labels_to_add = []
    @labels.each do |label|
      labels_to_add << {
        id: label.id,
        title: label.title,
        color: label.color,
        items: label.items
      }
    end

    File.write('labels.json', JSON.pretty_generate(labels_to_add))
  end

  def add_book
    puts 'Label:'
    label = gets.chomp.to_s
    puts 'Author:'
    author = gets.chomp.to_s
    puts 'Publish Date (YYYY, MM, DD): Note: Date should be in the given format'
    publish_date = gets.chomp
    puts 'Archived(Y/N):'
    archived = gets.chomp.to_s.upcase
    archived = archived == 'Y'
    puts 'Publisher:'
    publisher = gets.chomp.to_s
     puts 'Color:'  
    color = gets.chomp.to_s
    puts 'Cover State:'
    cover_state = gets.chomp.to_s
    puts 'Book added successfully.'
    book_obj = Book.new(publisher, cover_state, label, author, publish_date, archived)
    @books.push(book_obj)
    label_obj = Label.new(label, color)
    @labels.push(label_obj)
    author = Author.new(author)
    @authors.push(author)
    save_author(@authors)
  end

  def list_labels
    @labels.each do |label|
      puts "[#{label.title}] Title: #{label.title} Color: #{label.color} \n"
    end
  end

  def list_music_albums
    @music.list_music_album
  end

  def list_genres
    @music.list_genre
  end

  def add_music_album
    @music.add_music_album
  end
end

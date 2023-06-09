require 'json'
require 'fileutils'
require 'pry'

require_relative 'author'
require_relative 'game'
require_relative 'game_model'
require_relative 'save_game'
require_relative 'load_game'
require_relative './book'
require 'JSON'

class App
  def initialize
    @games = load_game
    @books = []
    @labels = []
  end

  include GameModel
  include SaveGame
  include LoadGame

  def load_books
    return unless File.exist?('books.json')

    books_data = JSON.parse(File.read('books.json'))
    books_data.each do |book|
      book_obj = Book.new(book['publisher'], book['cover_state'], book['genre'], book['author'], book['source'],
                          book['label'], book['publish_date'], book['archived'])
      @books.push(book_obj)
    end
  end

  def list_books
    return unless @books.length.positive?

    @books.each { |book| puts "Label: #{book.label} Author: #{book.author} Genre: #{book.genre}\n" }
  end

  def save_books
    books_to_add = []
    @books.each do |book|
      books_to_add << {
        id: book.id,
        publisher: book.publisher,
        cover_state: book.cover_state,
        genre: book.genre,
        author: book.author,
        source: book.source,
        label: book.label,
        publish_date: book.publish_date,
        archived: book.archived
      }
    end

    File.write('books.json', JSON.pretty_generate(books_to_add))
  end

  def add_book
    puts 'Label:'
    label = gets.chomp.to_s
    puts 'Author:'
    author = gets.chomp.to_s
    puts 'Publish Date (YYYY, MM, DD):'
    publish_date = gets.chomp
    puts 'Source:'
    source = gets.chomp.to_s
    puts 'Archived(Y/N):'
    archived = gets.chomp.to_s.upcase
    archived = archived == 'Y'
    puts 'Publisher:'
    publisher = gets.chomp.to_s
    puts 'Cover State:'
    cover_state = gets.chomp.to_s
    puts 'Genre:'
    genre = gets.chomp.to_s
    puts 'Book added successfully.'
    book_obj = Book.new(publisher, cover_state, genre, author, source, label, publish_date, archived)
    @books.push(book_obj)
  end

  def list_labels
    @labels.each do |label|
      puts "[#{label.title}] Title: #{label.title} Color: #{label.color} \n"
    end
  end
end

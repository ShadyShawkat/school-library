require_relative 'rental'

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_book_rental(date, person)
    @rentals << Rental.new(date, self, person)
  end

  def inspect
    print "Title: #{title}, Author: #{author}"
  end
end

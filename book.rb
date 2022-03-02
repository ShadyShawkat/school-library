require_relative 'rental'

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title, @author = title, author
    @rentals = []
  end

  def add_book_rental(date, person)
    @rentals << Rental.new(date, self, person)
  end
end
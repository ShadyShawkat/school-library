require_relative 'rental'

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title, @author = title, author
    @rentals = []
  end

  def rent(date)
    @rentals << Rental.new(date)
  end
end